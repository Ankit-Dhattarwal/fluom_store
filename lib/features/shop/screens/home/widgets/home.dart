import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../data/repositories/categories/category_controller.dart';
import '../../../controllers/home_controllers.dart';
import 'home_appbar/home_appbar.dart';
import 'home_categories.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/products/products_cart/product_card_vertical.dart';
import '../../../../../features/personalization/screens/all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());
  final ScrollController _scrollController = ScrollController();

  // var categoryController = Get.put(CategoryController());
  int perPageLimit = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  const THomeSecAppBar(),
                  const SizedBox(height: TSizes.spaceBtmSections),

                  // SearchBar
                  const SearchContainer(text: 'Search in Store'),
                  const SizedBox(height: TSizes.spaceBtmSections),

                  // Categories Heading
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Categories
                        Obx(() {
                          if (homeController.isLoading.value) {
                            return _buildShimmerEffectHome(context);
                          }
                          if (homeController.homeVerticalIconProducts.isEmpty) {
                            return Text('No data found');
                          }
                          return HomeCategories(categories: homeController
                              .homeVerticalIconProducts);
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtmSections),
                ],
              ),
            ),

            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Promo Slider and other widgets ...
                  Obx(() {
                    if (homeController.isLoading.value) {
                      return _buildShimmerEffect(context);
                    }
                    if (homeController.products.isEmpty) {
                      return Center(child: Text('No products found'));
                    }

                    return Column(
                      children: [
                        if (homeController.bannerProducts.isNotEmpty)
                          PromoSlider(
                            banners: homeController.bannerProducts
                                .map((product) => product['Image'] as String)
                                .toList(),
                          ),
                        SizedBox(height: TSizes.spaceBtmSections),
                        // Heading
                        SectionHeading(
                          title: 'Popular Products',
                          onPressed: () => Get.to(() => const AllProducts()),
                        ),

                        // Popular Products Grid
                        GridView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: MediaQuery
                                .of(context)
                                .size
                                .width / 600,
                          ),
                          itemCount: homeController.filteredProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            final product = homeController
                                .filteredProducts[index].data() as Map<
                                String,
                                dynamic>;
                            final productId = homeController
                                .filteredProducts[index].id;
                            final categoryName = productId
                                .split('-')
                                .first;
                            return ProductCardVertical(
                              productName: product['name'],
                              productImage: product['Image'],
                              productPrice: product['Price'],
                              productDetails: product['Details'],
                              productId: categoryName,
                              index: index,
                            );
                          },
                        ),
                      ],
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

  Widget _buildShimmerEffect(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(1, (index) => _buildShimmerItem(context)),
      ),
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: screenWidth * 0.82, // 350
                height: screenHeight * 0.2, // 250
              ),
              const SizedBox(width: 10.0),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtmSections,),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.3,
                  ),
                  const SizedBox(width: TSizes.spaceBtmSections,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.3,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShimmerEffectHome(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(1, (index) => _buildShimmerItemHome(context)),
      ),
    );
  }

  Widget _buildShimmerItemHome(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, right: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.09,
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.01,
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}