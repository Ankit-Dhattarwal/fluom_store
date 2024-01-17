import 'package:fluom/common/styles/shadows.dart';
import 'package:fluom/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/common/widgets/images/rounded_images.dart';
import 'package:fluom/features/personalization/screens/product_details/product_details.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../Icons/circular_icons.dart';
import '../../texts/brand_title_text_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_price/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    /// Container with side padding , color , edge and radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(color: TColors.darkGrey),
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImagesRadius),
          color: dark ? TColors.darkerGrey : TColors.whites,
        ),
        child: Column(
          children: [
            /// Thumnail , Wishlist Button and Discount Tag
            RoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumnail Images
                  const RounderImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
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
                      )),
                ],
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            /// --Details
              const Padding(
              padding:  EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(title: 'Green Nike Air Shoes',smallSize: true,),
                     SizedBox(height: TSizes.spaceBtwItems / 2,),
                    BrandTitleWithVerifiedIcon(title: 'Nike',),
                   // Add Spacer() here to keep the height of each box same in case 1 or case 2 lines of heading
                  ],
                ),
              ),
            ),

            /// Todo: Add Spacer() here to keep the height of each box same in case 1 or case 2 lines of heading
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Price
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.sm ),
                  child:  ProductPriceText(price: '35.0',),
                ),
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
    );
  }
}

