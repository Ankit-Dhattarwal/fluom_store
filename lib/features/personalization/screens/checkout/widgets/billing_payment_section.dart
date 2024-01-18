import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return  Column(
      children: [
        SectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.whites,
              child: const Image(image: AssetImage(TImages.paypalMethod), fit: BoxFit.contain,),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),
      ],
    );
  }
}
