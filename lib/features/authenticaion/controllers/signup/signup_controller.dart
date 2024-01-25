import 'package:fluom/data/repositories/authentication/authentication_repository.dart';
import 'package:fluom/data/repositories/user/user_repository.dart';
import 'package:fluom/features/authenticaion/screens/signup/signup_widget/email_verification_section/email_verify.dart';
import 'package:fluom/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variable
  final hidePassword = true.obs;  // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController();  // Controller for email input
  final lastName = TextEditingController();  // Controller for the last input
  final userName = TextEditingController();  // Controller for the user input
  final password = TextEditingController();  // Controller for the password input
  final firstName = TextEditingController();  // Controller for the first name input
  final phoneNumber = TextEditingController();  // Controller for the phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form Key for form validation


  /// --SIGNUP

 Future<void> signup() async{
   try{
     // Start loading
     TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.loadingAnimation);

     // Check Internet Connection
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected) {
         // Remove Loader
         TFullScreenLoader.stopLoading();
         return;
       }

     // Form Validation
     if(!signupFormKey.currentState!.validate()){
       // Remove Loader
       TFullScreenLoader.stopLoading();
       return;
     }

     // Privacy Policy Check
     if(!privacyPolicy.value){
       TLoaders.warningSnackBar(
           title: 'Accept Privacy Policy',
           message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.',
       );
       return;
     }

     // Register user in the Firebase Authentication & Save user data in the firebase
   final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     // Save Authentication user Data in the Firebase Firestore
     final newUser = UserModel(
       id: userCredential.user!.uid,
       firstName: firstName.text.trim(),
       lastName: lastName.text.trim(),
       username: userName.text.trim(),
       email: email.text.trim(),
       phoneNumber: phoneNumber.text.trim(),
       profilePicture: '',
     );

     final userRepository = Get.put(UserRepository());
     await userRepository.saveUserRecord(newUser);

     // Remove Loader
     TFullScreenLoader.stopLoading();

     // Show Success Message
     TLoaders.successSnackBar(title: 'Congratulation', message: 'Your account has been created! Verify email to continue.');

     //Move to Verify Email
     Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

   } catch(e){
     // Remove Loader
     TFullScreenLoader.stopLoading();

     // Show some Generic Error to the user
     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
}

}