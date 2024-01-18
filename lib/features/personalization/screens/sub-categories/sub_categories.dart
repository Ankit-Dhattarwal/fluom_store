import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/images/rounded_images.dart';
import '../../../../common/widgets/products/products_cart/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Banner
            const RounderImage(
              imageUrl: TImages.promoBanner2,
              width: double.infinity,
              applyImageRadius: true,
            ),
            const SizedBox(
              height: TSizes.spaceBtmSections,
            ),

            /// Sub- Categories
            Column(
              children: [
                ///--Heading
                SectionHeading(
                  title: 'Sports shirts',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const ProductCartHorizontal(),
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(width: TSizes.spaceBtwItems,),
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
