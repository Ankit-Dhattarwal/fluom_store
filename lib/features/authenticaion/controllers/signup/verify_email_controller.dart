import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluom/common/widgets/success_screen_widget/success_screen.dart';
import 'package:fluom/data/repositories/authentication/authentication_repository.dart';
import 'package:fluom/utils/constants/text_strings.dart';
import 'package:fluom/utils/popups/loader.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
   sendEmailVerification(){
    try{
      AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Sent', message: 'Please Check your inbox and verify your email.');

    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
   }

  /// Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async{
    await  FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user?.emailVerified ?? false){
      timer.cancel();
      Get.off(() => SuccessScreen(
          image: TImages.sendEmailSuccessful,
          title: TTexts.yourAccountCreatedTitle,
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ),
      );
    }
    });
  }


  /// Manually Check if Email Verified
   checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off(
          () => SuccessScreen(
            image: TImages.emailSendSuccessfullyAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
      );
    }
   }
}
