import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widgets/loaders/animation_loader.dart';


/// A utility class for managing a full-screen loading dialog
class TFullScreenLoader{
/// Open a full-screen loading dialog with the given text and animation
  /// This method doesn't return anythings
  ///
  /// Parameter:
  ///   -text: The text to be displayed in the loading dialog
  ///   -animation: The Lottie animation to be shown.

  static void openLoadingDialog(String text, String animation){
    showDialog(
        context: Get.overlayContext!,  // Use Get.overlayContext for overlay dialogs
        barrierDismissible: false,   // The dialog can't be dismissed by tapping outside it
        builder: (_) => WillPopScope(
          // canPop: false,  // Disable popping with the back button
          onWillPop: () async {
            return Future.value(true);
          },
          child: Container(
            color: THelperFunction.isDarkMode(Get.context!) ? TColors.dark : TColors.whites,
            width: double.infinity,
            height: double.infinity,
            child:  Column(
              children: [
               const SizedBox(height: 250,),
                Expanded(child: TAnimationLoaderWidget(text: text, animation: animation)),
              ],
            ),
          ),
        )
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anythings.
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();   // Close the dialog using the Navigator
  }
}