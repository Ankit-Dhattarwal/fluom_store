import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluom/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/widgets/custom_shape/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shape/containers/search_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../data/repositories/categories/category_controller.dart';
import 'home_appbar/home_appbar.dart';
import 'home_categories.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../common/widgets/products/products_cart/product_card_vertical.dart';
import '../../../../../features/personalization/screens/all_products/all_products.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var categoryController = Get.put(CategoryController());
  ScrollController _scrollController = ScrollController();
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
                  THomeSecAppBar(),
                  SizedBox(height: TSizes.spaceBtmSections),

                  // SearchBar
                  SearchContainer(text: 'Search in Store'),
                  SizedBox(height: TSizes.spaceBtmSections),

                  // Categories Heading
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // Categories
                        FutureBuilder<List<DocumentSnapshot>>(
                          future: fetchHomeVerticalIconProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting ||
                                snapshot.connectionState == ConnectionState.none) {
                            }

                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            if (snapshot.hasData && snapshot.data != null) {
                              List<DocumentSnapshot> homeVerticalIconProducts = snapshot.data!;

                              return HomeCategories(categories: homeVerticalIconProducts);
                            } else {
                              return Text('No data found');
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtmSections),
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
                    if (categoryController.isLoading.value) {
                      return _buildShimmerEffect(context);
                    }

                    return StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collectionGroup('Items').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting ||
                            snapshot.connectionState == ConnectionState.none) {
                           return _buildShimmerEffect(context);
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text('Something went wrong'));
                        }

                        if (snapshot.hasData && snapshot.data != null) {
                          final List<DocumentSnapshot> products = snapshot.data!.docs;

                          if (products.isEmpty) {
                            return Center(child: Text('No products found'));
                          }

                          // Separate lists for 'Banner' and 'HomeVerticalIcon' categories
                          List<DocumentSnapshot> bannerProducts = [];
                          List<DocumentSnapshot> homeVerticalIconProducts = [];
                          Map<String, List<DocumentSnapshot>> categoryMap = {};

                          products.forEach((product) {
                            String categoryId = product.id.split('-').first;
                            if (categoryId == 'Banner') {
                              bannerProducts.add(product);
                            } else if (categoryId == 'HomeVerticalIcon') {
                              homeVerticalIconProducts.add(product);
                            } else {
                              categoryMap.putIfAbsent(categoryId, () => []).add(product);
                            }
                          });

                          List<DocumentSnapshot> filteredProducts = [];
                          categoryMap.forEach((key, value) {
                            filteredProducts.addAll(value.take(perPageLimit));
                          });

                          return Column(
                            children: [
                              // Promo Slider
                              if (bannerProducts.isNotEmpty)
                                PromoSlider(
                                  banners: bannerProducts
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
                                  childAspectRatio: MediaQuery.of(context).size.width / 600,
                                ),
                                itemCount: filteredProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final product = filteredProducts[index].data() as Map<String, dynamic>;
                                  final productId = filteredProducts[index].id;
                                  final categoryName = productId.split('-').first;
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
                        } else {
                          return Center(child: Text('No products found'));
                        }
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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

  Future<List<DocumentSnapshot>> fetchHomeVerticalIconProducts() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collectionGroup('Items').get();
    List<DocumentSnapshot> products = snapshot.docs;

    List<DocumentSnapshot> homeVerticalIconProducts = [];
    products.forEach((product) {
      String categoryId = product.id.split('-').first;
      if (categoryId == 'HomeVerticalIcon') {
        homeVerticalIconProducts.add(product);
      }
    });

    return homeVerticalIconProducts;
  }
}
