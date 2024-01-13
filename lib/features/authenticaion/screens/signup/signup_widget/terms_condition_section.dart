import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          // Here sized box is used for the decrease the left space
          height: 24,
          width: 24,
          child: Checkbox(value: true, onChanged: (value) {}),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: '${TTexts.iAgreeTo}', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.whites : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.whites : TColors.primary,
              )),
              TextSpan(text: '${TTexts.and}', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: ' ${TTexts.termsOfUse}', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.whites : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.whites : TColors.primary,
              )),
            ]
        ))
      ],
    );
  }
}