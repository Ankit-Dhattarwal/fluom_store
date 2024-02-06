import 'package:fluom/common/widgets/images/circular_images.dart';
import 'package:fluom/common/widgets/products/product_price/product_price_text.dart';
import 'package:fluom/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:fluom/common/widgets/texts/product_title_text.dart';
import 'package:fluom/utils/constants/enums.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/containers/roundedConatiner.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            RoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),

            /// Prices
            Text('\$255', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: TSizes.spaceBtwItems,),
           /// Herer use the api prices
           // const ProductPriceText(price: '175', isLarge: true,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        /// Title
        const ProductTitleText(title: 'Green Nike Sports Shoes'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),

        /// Stock Status
        Row(
          children: [
            const ProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5,),
        /// Brand
         Row(
          children: [
            CircularImage(
              width: 32,
                height: 32,
                image:  TImages.nikeLogoOrg,
              overlayColor: dark ? TColors.whites : TColors.black,
            ),
            const BrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
