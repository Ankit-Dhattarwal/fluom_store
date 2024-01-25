

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluom/data/repositories/authentication/authentication_repository.dart';
import 'package:fluom/data/repositories/user/user_repository.dart';
import 'package:fluom/features/authenticaion/screens/login/login.dart';
import 'package:fluom/features/personalization/screens/profile/profile_widgets/re_authenticate_user_login_fom.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:fluom/utils/popups/full_screen_loader.dart';
import 'package:fluom/utils/popups/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders/network_manager.dart';
import '../../../data/repositories/user/user_model.dart';
import '../../../utils/constants/sizes.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user Record
  Future<void> fetchUserRecord() async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch(e){
      user(UserModel.empty());
    } finally{
      profileLoading.value = false;
    }
  }

  /// Save user record from any Registration provider
   Future<void> saveUserRecord(UserCredential? userCredentials) async{
     try{
       if(userCredentials != null){
         // Convert name to firstName and lastName
         final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
         final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

         // Map Data
         final user = UserModel(
             id: userCredentials.user!.uid,
             username: username,
             email: userCredentials.user!.email ?? '',
             firstName: nameParts[0],
             lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
             phoneNumber: userCredentials.user!.phoneNumber ?? '',
             profilePicture: userCredentials.user!.photoURL ?? '',
         );

         // Save user Data
         await userRepository.saveUserRecord(user);
       }
     } catch(e){
       TLoaders.warningSnackBar(
           title: 'Data not saved',
         message: 'Something went wrong while saving your information. You can re-save your data in your Profile.',
       );
     }
   }

   /// Delete Account Warning
   void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText:
        'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: TSizes.lg), child: Text('Delete'),),
      ),
      cancel: OutlinedButton(
        child: const Text('Cancel'),
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
   }

   /// Delete User Account
  void deleteUserAccount() async{
    try{
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingAnimation);

      /// First Re-Authentication user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        // Re verify Auth Email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll( () => const LoginScreen());
        } else if(provider == 'password'){
          TFullScreenLoader.stopLoading();
          Get.to( () => const ReAuthLoginForm());
        }
      }
    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Re-Authentication before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async{
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('Processing', TImages.loadingAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}