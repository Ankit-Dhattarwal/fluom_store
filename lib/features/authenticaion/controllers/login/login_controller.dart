

import 'package:fluom/data/repositories/authentication/authentication_repository.dart';
import 'package:fluom/features/personalization/controllers/user_controller.dart';
import 'package:fluom/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loader.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
}

///-- Email & Password SignIn
 Future<void> emailAndPasswordSignIn() async{
   try{
     // start loading
     TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);

     // Check Internet Connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected) {
       // Remove Loader
       TFullScreenLoader.stopLoading();
       return;
     }

     // Form Validation
     if(!loginFormKey.currentState!.validate()){
       // Remove Loader
       TFullScreenLoader.stopLoading();
       return;
     }

     // Save Data if Remember Me is selected
     if(rememberMe.value) {
       localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
       localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
     }

       // Login user using Email & Password Authentication
       final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

       // Remove loader
       TFullScreenLoader.stopLoading();

       // Redirect
       AuthenticationRepository.instance.screenRedirect();
   }catch(e){
     // Remove Loader
     TFullScreenLoader.stopLoading();

     // Show some Generic Error to the user
     TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
 }


 /// -- Google Sign-In Authentication
  Future<void> googleSignIn() async{
    try{
      // Start loader
      TFullScreenLoader.openLoadingDialog('Logging you in...', TImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected =  await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      // Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}