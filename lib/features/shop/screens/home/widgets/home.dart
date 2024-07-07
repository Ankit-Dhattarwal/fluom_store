import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:fluom/features/personalization/screens/all_products/all_products.dart';
import 'package:fluom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../data/repositories/categories/category_controller.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'home_appbar/home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  var categoryController = Get.put(CategoryController());


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
                  SizedBox(
                    height: TSizes.spaceBtmSections,
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),

              /// Promo Slider
              child: Column(
                mainAxisSize: MainAxisSize.max,
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
                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),

                  /// Popular Products
                  Obx(() {
                    if (categoryController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return StreamBuilder(
                      stream: FirebaseFirestore.instance.collectionGroup('Products').snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return const Center(child: Text('Something went wrong'));
                        }

                        final List<DocumentSnapshot> products = snapshot.data!.docs;

                        if (products.isEmpty) {
                          return const Center(child: Text('No products found'));
                        }

                        return GridView.builder(
                          shrinkWrap: true, // Ensure the GridView is inside a scrollable parent
                          physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: MediaQuery.sizeOf(context).width / 650,
                          ),
                          itemCount: products.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = products[index].data() as Map<String, dynamic>;
                            final productId = products[index].id;
                            return ProductCardVertical(
                              productName: product['name'],
                              productImage: product['Image'],
                              productPrice: product['Price'],
                              productDetails: product['Details'],
                              productId: productId,
                              index: index,
                            );
                          },
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}