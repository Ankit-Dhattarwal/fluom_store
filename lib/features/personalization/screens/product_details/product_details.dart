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

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1.-Product Image Slider
            const ProductImageSlider(),

            /// 2.-Product Details
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                  right: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// --Rating & Share
                  const RatingShare(),

                  /// --Price , title , Stock and Brand
                  const ProductMetaData(),

                  /// --Attributes
                  const ProductAttributes(),
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
                  const ReadMoreText(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using , making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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
                    title: 'Reviews(199)',
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
