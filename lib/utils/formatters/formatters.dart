import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);  // Customize the date format as needed
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber){
    // Assuming a 10 digit Indian Phone Number format: 70152-16280
    if(phoneNumber.length == 10){
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    }else if(phoneNumber.length == 11){
      return '(${phoneNumber.substring(0,4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    // add more custom phone number formatting logic for different format is needed.
    return phoneNumber;
  }

  // Not Fully tested
  // static String InternationalFormatPhoneNumber(String phoneNumber){
  //   // Remove any non-digit characters form the phone number
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
  //
  //   // Extract the country code form digitOnly
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';
  //   digitsOnly = digitsOnly.substring(2);
  //
  //   // Add remaining digit with proper formatting
  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');
  //
  //  int i = 0;
  //   while(i < digitsOnly.length){
  //     int groupLength = 2;
  //     if(i == 0 && countryCode == '+1'){
  //       groupLength = 3;
  //     }
  //
  //     int end = i + groupLength;
  //     formattedNumber.write(digitsOnly.substring(i, end));
  //
  //     if(end < digitsOnly.length){
  //       formattedNumber.write(' ');
  //     }
  //
  //    i = end;
  //   }
  // }
}