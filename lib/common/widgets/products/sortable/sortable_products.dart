import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../products_cart/product_card_vertical.dart';


class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) => DropdownMenuItem(
              value: option,
              child: Text(option)
          ),)
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtmSections,),
        /// Products
        GridLayout(itemCount: 4, itemBuilder: (_, index) =>  ProductCardVertical(index: index,))
      ],
    );
  }
}
