
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100),),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSizes.iconsMd,
              height: TSizes.iconsMd,
              image: AssetImage(
                TImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100),),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: TSizes.iconsMd,
              height: TSizes.iconsMd,
              image: AssetImage(
                TImages.facebook,
              ),
            ),
          ),
        ),
      ],
    );
  }
}