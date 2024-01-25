import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluom/data/repositories/user/user_repository.dart';
import 'package:fluom/features/authenticaion/screens/login/login.dart';
import 'package:fluom/features/authenticaion/screens/onboarding/onboarding.dart';
import 'package:fluom/features/authenticaion/screens/signup/signup_widget/email_verification_section/email_verify.dart';
import 'package:fluom/navigation_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {

  /*
  static keyword: Once any is static then without create a new instance of that class
  we are directly call the that class
   */
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authentication User Data
  User? get authUser => _auth.currentUser;

  /// Collect from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to show Relevant Screen
  screenRedirect() async {
    // If the user is logged in
    final user = _auth.currentUser;
    if(user != null) {
      if (user.emailVerified) {
        // If the user's email is verified, navigate to the Navigation Menu
        Get.offAll(() => const NavigationMenu());
      } else {
        // If the user's email is not verified, navigate to the VerifyEmailScreen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser!.email));
      }
    } else{

      // Local Storage
      if(kDebugMode){
        print('====================== GET STORAGE Auth Repo =====================');
        print(deviceStorage.read('IsFirstTime'));
      }

      deviceStorage.writeIfNull('IsFirstTime', true);
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())  // Redirect to Login Screen if not first time
          : Get.offAll(() => const OnBoardingScreen()); // Redirect to onBoarding Screen if it's the first time

    }

 }

  /*
  <--------------------- Email & Password sign-in ---------------------->
   */

  ///--- [EmailAuthentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
      //  throw 'Firebase Auth Exception';
    } on FirebaseException catch(e) {
      // throw 'Firebase Exception';
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      // throw 'Format Exception';
      throw const TFormatException();
    } on PlatformException catch (e) {
      // throw 'Platform Exception';
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///--- [EmailAuthentication] - REGISTER
  Future<UserCredential>  registerWithEmailAndPassword(String email, String password) async{
    try{
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
    //  throw 'Firebase Auth Exception';
    } on FirebaseException catch(e) {
     // throw 'Firebase Exception';
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
     // throw 'Format Exception';
       throw const TFormatException();
    } on PlatformException catch (e) {
     // throw 'Platform Exception';
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  ///--- [EmailAuthentication] - SignIn

///--- [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async{
    try{
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // Re-Authenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    }on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;
      //  throw 'Firebase Auth Exception';
    } on FirebaseException catch(e) {
      // throw 'Firebase Exception';
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      // throw 'Format Exception';
      throw const TFormatException();
    } on PlatformException catch (e) {
      // throw 'Platform Exception';
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

///--- [EmailVerification] - MAIL VERIFICATION

Future<void> sendEmailVerification() async{
    try{
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch(e) {
       throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
}

///--- [EmailAuthentication] - FORGET PASSWORD

  Future<void> sendPasswordResetEmail(String email) async{
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

/*
  <--------------------- Federated identity & social sign-in ---------------------->
   */

///--- [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async{
    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details form the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);


    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }  catch(e){
      if(kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

///--- [FacebookAuthentication] - FACEBOOK

/*
  <--------------------- ./end Federated identity & social sign-in ---------------------->
   */


///--- [LogoutUser] - FORGET PASSWORD
  Future<void> logout() async{
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll( () => const LoginScreen());
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

///--- DELETE USER - Remove user Auth and Firebase Account
  Future<void> deleteAccount() async{
    try{
      await UserRepository.instance.removeUserRecrod(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch(e) {
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }  catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

}
