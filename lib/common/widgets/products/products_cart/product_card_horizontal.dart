import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/common/widgets/images/rounded_images.dart';
import 'package:fluom/common/widgets/products/product_price/product_price_text.dart';
import 'package:fluom/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:fluom/common/widgets/texts/product_title_text.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadows.dart';
import '../../Icons/circular_icons.dart';

class ProductCartHorizontal extends StatelessWidget {
  const ProductCartHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
      //  border: Border.all(color: TColors.darkGrey),
       // boxShadow: [ShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(TSizes.productImagesRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          ///Thumbnail
          RoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child:  Stack(
              children: [
                /// -- Thumbnail Images
                const SizedBox(
                  height: 120,
                    width: 120,
                    child: RounderImage(
                  imageUrl: TImages.productImage1,
                  applyImageRadius: true,
                ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                 const Positioned(
                    top: 0,
                    right: 0,
                    child: CircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                 ),
              ],
            ),
          ),

          /// Details
          SizedBox(
           width: 162,
           child: Padding(padding: EdgeInsets.only(top:TSizes.sm, left: TSizes.sm),
               child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductTitleText(title: 'Green Nike Half Sleeves Shirts', smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems / 2,),
                      BrandTitleWithVerifiedIcon(title: 'Nike'),
                    ],
                  ),

                   const Spacer(),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       /// Pricing
                       const Flexible(child: ProductPriceText(price: '35.0')),

                       /// Add to Carts
                       Container(
                         decoration: const BoxDecoration(
                           color: TColors.dark,
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(TSizes.cardRadiusMd),
                             bottomRight: Radius.circular(TSizes.productImagesRadius),
                           ),
                         ),
                         child: const SizedBox(
                           width: TSizes.iconsLg * 1.2,
                           height: TSizes.iconsLg * 1.2,
                           child:  Center(
                             child: Icon(
                               Iconsax.add, color: TColors.whites,
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                ],
              ),
           ),
         ),
        ],
      ),
    );
  }
}
