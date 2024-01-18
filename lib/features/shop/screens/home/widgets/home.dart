import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluom/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:fluom/features/personalization/screens/all_products/all_products.dart';
import 'package:fluom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../../common/widgets/image_text_widget/vertical_images_text.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../common/widgets/layout/grid_layout.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'home_appbar/home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const PrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeSecAppBar(),
                  SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),

                  /// SearchBar
                  SearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),

                  /// -- Categories Heading
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        /// --Categories
                        HomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtmSections,),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              /// Promo Slider
              child: Column(
                children: [
                  const PromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),

                  /// -- Heading
                   SectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts()),),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                  /// Popular Products
               GridLayout(itemCount: 2, itemBuilder: (_, index) => const ProductCardVertical(),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

