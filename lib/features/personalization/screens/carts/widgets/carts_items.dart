import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/carts/carts_items.dart';
import '../../../../../common/widgets/products/carts/widgets/add_remove_button.dart';
import '../../../../../common/widgets/products/product_price/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showRemoveButton = true,
  });

  final bool showRemoveButton;

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: TSizes.spaceBtmSections,
      ),
      itemCount:2,
      itemBuilder: (_, index) =>  Column(
        children: [
          /// Carts Items
          const CartItem(),
          if(showRemoveButton) const SizedBox(height: TSizes.spaceBtwItems,),

           /// Add Remove Button Row with total Prices
          if(showRemoveButton)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// Extra Space
                  SizedBox(width: 70,),
                  /// Add Remove Buttons
                  ProductQualityWithAddRemove(),
                ],
              ),
             ///Here user the api prices
             // ProductPriceText(price: '250'),
            ],
          ),
        ],
      ),
    );
  }
}
