import 'package:fluom/features/authenticaion/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class  OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find(); // Here this instance calling by Get.find();


  /// Variables
   final pageController = PageController();
   //final currentPageIndex = 0.obs;
   Rx<int> currentPageIndex = 0.obs;  // this obs basically a oberver that is a widget which change the design without using stateful widget

  /// Update Current Index when Page Scroll
   void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
   void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
   }

  /// Update Current Index & Jump to next page
   void nextPage() {
    if(currentPageIndex == 2){

     final storage = GetStorage();

     if(kDebugMode){
      print('====================== GET STORAGE NEXT BUTTON =====================');
      print(storage.read('IsFirstTime'));
     }

     storage.write('IsFirstTime', false);

     if(kDebugMode){
      print('====================== GET STORAGE NEXT BUTTON 2 =====================');
      print(storage.read('IsFirstTime'));
     }

     Get.offAll(const LoginScreen());
    }else{
        int page = currentPageIndex.value + 1;
        pageController.jumpToPage(page);
    }
   }

  /// Update Current Index & jump to the last Page
   void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
   }


}