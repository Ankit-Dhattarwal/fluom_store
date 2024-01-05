import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class TValidator{
   static String? validateEmail(String? value){
     if(value == null || value.isEmpty){
       return 'Email is required';
     }
     // Regular expression for email verification
     final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

     if (!emailRegExp.hasMatch(value)){
       return 'Invalid emial address.';
     }
     return null;
   }

   static String? validatePassword(String? value){
     if(value == null || value.isEmpty){
       return 'Password is required.';
     }

     // check for minimum password length
     if(value.length < 6){
       return 'Password must be at least 6 characters long.';
     }
     // Check for uppercase letters
     if(!value.contains(RegExp(r'[A-Z]'))){
       return 'Password must be contain at least one uppercase letter.';
     }
     // Check for numbers
     if(!value.contains(RegExp(r'0-9'))){
       return 'Password must contain at least one number.';
     }
     // Check for special numbers
     if(!value.contains(RegExp(r'!@#$%^&*(),.?":{}|<>]'))){
       return 'Password must contain at least one special character';
     }
     return null;
   }

   static String? validatePhoneNumber(String? value){
     if(value == null || value.isEmpty){
       return 'Phone number is required';
     }

    // Regular expression for phone number validation (assuming a 10-digit phone number format)
     final phoneRegExp = RegExp(r'^\d{10}$');

     if(!phoneRegExp.hasMatch(value)){
       return 'Invalid phone number format (10-digits required)';
     }
     return null;
   }

   // Add more custom validators as needed for your specific requirements 
}