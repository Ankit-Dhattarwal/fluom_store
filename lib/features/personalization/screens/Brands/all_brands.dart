import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/layout/grid_layout.dart';
import 'package:fluom/common/widgets/products/sortable/sortable_products.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/features/personalization/screens/Brands/brand_products.dart';
import 'package:fluom/features/shop/screens/store/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: Text('Brands'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --Heading
              const SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// --Brands
              GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) =>  BrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => const BrandProducts()),
                      ),),
            ],
          ),
        ),
      ),
    );
  }
}
