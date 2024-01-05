import 'package:fluom/utils/themes/custom_themes/appbar_theme.dart';
import 'package:fluom/utils/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:fluom/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:fluom/utils/themes/custom_themes/chip_theme.dart';
import 'package:fluom/utils/themes/custom_themes/outlined_button_theme.dart';
import 'package:fluom/utils/themes/custom_themes/text_field_theme.dart';
import 'package:fluom/utils/themes/custom_themes/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_themes/elevated_button_theme.dart';

class TAppTheme {
  TAppTheme._();   // Here our constructor is private so that no use again and again

/* so our constructor is private so that create static function
   so that we can easly call them by  ( TAppTheme.namefucntion )
 */

 //  static ThemeData lightTheme () {}
/*
if you call like this as above and another way is--

 */

 static ThemeData lightTheme = ThemeData(
   useMaterial3: true,
   fontFamily: GoogleFonts.poppins().fontFamily,
   brightness: Brightness.light,
   primaryColor: Colors.blue,
   chipTheme: TChipTheme.lightChipTheme,
   scaffoldBackgroundColor: Colors.white,
   textTheme:  TTextTheme.lightTextTheme,
   appBarTheme: TAppBarTheme.lightAppBarTheme,
   checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
   bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
   elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
   outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
   inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,  // InputDecorationTheme is TextFieldTheme
 );
 static ThemeData dartTheme = ThemeData(
   useMaterial3: true,
   fontFamily: GoogleFonts.poppins().fontFamily,
   brightness: Brightness.dark,
   primaryColor: Colors.blue,
   chipTheme: TChipTheme.lightChipTheme,
   scaffoldBackgroundColor: Colors.white,
   textTheme:  TTextTheme.lightTextTheme,
   appBarTheme: TAppBarTheme.lightAppBarTheme,
   checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
   bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
   elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
   outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
   inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
 );

}