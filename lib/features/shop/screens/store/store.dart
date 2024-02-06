import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/appbar/tapbar.dart';
import 'package:fluom/common/widgets/custom_shape/containers/search_container.dart';
import 'package:fluom/common/widgets/layout/grid_layout.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/features/shop/controllers/category_controller.dart';
import 'package:fluom/features/shop/screens/store/widgets/categories_tabs.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/carts/widgets/cart_menu_icons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/screens/Brands/all_brands.dart';
import 'brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
  //  final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: HomeAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            CartCounterIcon(
              onPressed: () {},
              iconColor: TColors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunction.isDarkMode(context)
                    ? TColors.black
                    : TColors.whites,
                expandedHeight: 440, // this is size

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// --Search bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtmSections,
                      ),

                      /// --Featured Brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      GridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                        return const BrandCard(showBorder: true,);
                      }),
                    ],
                  ),
                ),

                /// --TabBar
                bottom:  const StoreTabBar(
                  tabs: [
                    Tab(child: Text('Sports'),),
                    Tab(child: Text('Furniture'),),
                    Tab(child: Text('Electronics'),),
                    Tab(child: Text('Clothes'),),
                    Tab(child: Text('Cosmetics'),),
                  ],
                )
              ),
            ];
          },
          /// --Body
          body:  const TabBarView(
            children: [CategoriesTab(), CategoriesTab(), CategoriesTab(), CategoriesTab(), CategoriesTab(),
            ],
          ),
        ),
      ),
    );
  }
}
