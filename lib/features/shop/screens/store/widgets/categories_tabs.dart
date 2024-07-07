import 'package:fluom/common/widgets/layout/grid_layout.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/brand/brands_cards.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../data/repositories/categories/category_controller.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';


class CategoriesTab extends StatelessWidget {
  var categoryController = Get.put(CategoryController());

   CategoriesTab({super.key});

 // final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_ ,int index) {
        categoryController.userList.length;
        return
          Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [

                /// --Brands
                const BrandShowCase(images: [
                  TImages.productImageNikeJacket,
                  TImages.productImageNikeJacket,
                  TImages.productImageNikeJacket,
                ],),
                const BrandShowCase(images: [
                  TImages.productImageNikeJacket,
                  TImages.productImageNikeJacket,
                  TImages.productImageNikeJacket,
                ],),
                const SizedBox(height: TSizes.spaceBtwItems,),

                /// Products
                SectionHeading(title: 'You might like',
                  showActionButton: true,
                  onPressed: () {},),
                const SizedBox(height: TSizes.spaceBtwItems,),

                // GridLayout(itemCount: 4,
                //     itemBuilder: (_, index) =>
                //         ProductCardVertical(index: index,)),
                const SizedBox(height: TSizes.spaceBtmSections,),

              ],
            ),
          );
      },
    );
  }
}
