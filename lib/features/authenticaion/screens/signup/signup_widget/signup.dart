import 'package:fluom/common/styles/widgets_login_signup/form_divider.dart';
import 'package:fluom/common/styles/widgets_login_signup/social_button.dart';
import 'package:fluom/features/authenticaion/screens/signup/signup_widget/signup_form.dart';
import 'package:fluom/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../../utils/constants/sizes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signUpTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtmSections),

              /// Form
              const signup_form(),
              const SizedBox(height: TSizes.spaceBtmSections,),

              /// Divider
              FormDivider(dividerText: TTexts.orSignUpWith.capitalize!,),
              const SizedBox(height: TSizes.spaceBtmSections,),

              /// Socail Button & Footer
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}


