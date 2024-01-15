import 'package:fluom/common/widgets/layout/grid_layout.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:flutter/material.dart';

import '../../../../../common/brand/brands_cards.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';


class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --Brands
              const BrandShowCase(images: [TImages.productImageNikeJacket, TImages.productImageNikeJacket, TImages.productImageNikeJacket,],),
              const BrandShowCase(images: [TImages.productImageNikeJacket, TImages.productImageNikeJacket, TImages.productImageNikeJacket,],),
              const SizedBox(height: TSizes.spaceBtwItems,),

              /// Products
              SectionHeading(title: 'You might like', showActionButton: true, onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems,),

              GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
              const SizedBox(height: TSizes.spaceBtmSections,),

            ],
          ),
        ),
      ],
    );
  }
}
