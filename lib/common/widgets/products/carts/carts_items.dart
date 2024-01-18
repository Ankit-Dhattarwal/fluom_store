import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_images.dart';
import '../../texts/brand_title_text_verified_icon.dart';
import '../../texts/product_title_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  // final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Images
        RounderImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(
            TSizes.sm,
          ),
          backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        /// Title , Prices & Sizes
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: ProductTitleText(title: 'Green Sports shoes', maxLines: 1,)),

              /// Attributes
              Text.rich(
                TextSpan(
                    children: [
                      TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                      TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                      TextSpan(text: 'IN 08 ', style: Theme.of(context).textTheme.bodyLarge),
                    ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
