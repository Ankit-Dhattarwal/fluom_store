
import 'package:fluom/utils/constants/sizes.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../common/styles/spacing/spacing_styles.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../common/styles/widgets_login_signup/form_divider.dart';
import '../../../../common/styles/widgets_login_signup/social_button.dart';
import 'login_page/login_form.dart';
import 'login_page/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                children: [
                  /// Logo , Title & Sub-Title
                  LoginHeader(DividerText: TTexts.orSignInWith.capitalize!,),
                  /// Form
                  const LoginForm(),

                  /// Divider
                  FormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
                  const SizedBox(height: TSizes.spaceBtmSections),
                  /// Footer
                  const SocialButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


