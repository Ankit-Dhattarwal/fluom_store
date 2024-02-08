import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/common/widgets/products/product_price/product_price_text.dart';
import 'package:fluom/common/widgets/texts/product_title_text.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../utils/constants/colors.dart';

class ProductAttributes extends StatelessWidget {
  final double price;
  final String description;
  const ProductAttributes({super.key, required this.price, required this.description});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// --Selected Attributes Pricing & Description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title , Prices and Stock Status
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Prices : ',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          /// Actual Prices
                          Text(
                            (price - price /3).toStringAsFixed(2),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          /// Sale Prices
                          /// here use the api price
                      //    const ProductPriceText(price: '20.0'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
               ProductTitleText(
                title: description,
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// -- Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChips(text: 'Green', selected: true, onSelected: (value) {},),
                ChoiceChips(text: 'Blue', selected: false,onSelected: (value) {},),
                ChoiceChips(text: 'Yellow', selected: false,onSelected: (value) {},),
              ],
            ),
          ],
        ),
        /// --Sizes
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(title: 'Size', showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChips(text: 'EU 34', selected: true,onSelected: (value) {},),
                ChoiceChips(text: 'EU 36', selected: false,onSelected: (value) {},),
                ChoiceChips(text: 'EU 38', selected: false,onSelected: (value) {},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
