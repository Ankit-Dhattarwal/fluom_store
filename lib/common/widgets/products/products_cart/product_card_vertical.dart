import 'package:fluom/common/styles/shadows.dart';
import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/features/personalization/screens/product_details/product_details.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../data/repositories/categories/category_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../Icons/circular_icons.dart';
import '../../images/rounded_image_only_Network.dart';
import '../../texts/brand_title_text_verified_icon.dart';
import '../../texts/product_title_text.dart';
import '../product_price/product_price_text.dart';

class ProductCardVertical extends StatelessWidget {
   ProductCardVertical({super.key, required this.index});

   final int index;
  var categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    /// Container with side padding , color , edge and radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(imageUrl: categoryController.userList[index].image.first, price: categoryController.userList[index].price, description: categoryController.userList[index].description, rating: categoryController.userList[index].rating.rate, count: categoryController.userList[index].rating.count,)),
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
                  Obx((){
                    final List<String> images = categoryController.userList[index].image;
                    final String firstImage = images.isNotEmpty ? images.first : '';
                   // print('Image URL: $firstImage');
                    return  RounderImageNetwork(
                      imageUrl: firstImage,
                      applyImageRadius: true,
                    );
        },
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
                        (categoryController.userList[index].price - categoryController.userList[index].price/3).toInt().toString() + ' %',
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
               Padding(
              padding:  EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitleText(title: categoryController.userList[index].title,smallSize: true,),
                     const SizedBox(height: TSizes.spaceBtwItems / 2,),
                    const BrandTitleWithVerifiedIcon(title: 'Nike',),
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
                 Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm ),
                  child:  ProductPriceText(price: categoryController.userList[index].price,),
                ),

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
    );
  }
}

