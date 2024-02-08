import 'package:fluom/common/widgets/Icons/circular_icons.dart';
import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import 'package:fluom/common/widgets/images/rounded_images.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/features/personalization/screens/product_details/widgets/product_add_to_cart_widget.dart';
import 'package:fluom/features/personalization/screens/product_details/widgets/product_attributes.dart';
import 'package:fluom/features/personalization/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:fluom/features/personalization/screens/product_details/widgets/product_meta_data.dart';
import 'package:fluom/features/personalization/screens/product_details/widgets/rating_share_widgets.dart';
import 'package:fluom/features/personalization/screens/product_reviews/products_reviews.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../data/repositories/categories/category_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetails extends StatelessWidget {
  final String imageUrl;
  final double price;
  final String description;
  final double rating;
  final int count;
  const ProductDetails({super.key, required this.imageUrl, required this.price, required this.description, required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1.-Product Image Slider
             ProductImageSlider(imageUrl: imageUrl),

            /// 2.-Product Details
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  right: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// --Rating & Share
                   RatingShare(rating: rating, count: count,),

                  /// --Price , title , Stock and Brand
                   ProductMetaData(price: price,),

                  /// --Attributes
                  ProductAttributes(price: price, description: description,),
                  const SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),

                  /// --Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'),
                      )),
                  const SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),

                  /// --Description
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                   ReadMoreText(
                    description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// --Reviews
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SectionHeading(
                    title: 'Reviews(${price ~/ 2})',
                    onPressed: () {},
                      showActionButton: false,
                  ),
                      IconButton(onPressed: () => Get.to(() => const ProductReviews()), icon: const Icon(Iconsax.arrow_right_3, size: 18,))
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
