
/*
 Here by this command you can use the SHA ,-->
 keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
 */

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';



Future<void> main() async {
  /// Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Stripe Gateway Key
  Stripe.publishableKey = "pk_test_51PN19wJcKq48gXJu3lykDFo0yrs4xuM4km4yrVeXRbEYlqjxXkRW1A2kl7Ix32gZM2O95qTbQPyqwQyan5o5UmIE00XIvvBESf";

  /// GetX Local Storage
   await GetStorage.init();

FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
          (FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}


