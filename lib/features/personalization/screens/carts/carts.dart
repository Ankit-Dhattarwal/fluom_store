import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/products/product_price/product_price_text.dart';
import 'package:fluom/features/personalization/screens/carts/widgets/carts_items.dart';
import 'package:fluom/features/personalization/screens/checkout/checkout.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/products/carts/carts_items.dart';
import '../../../../common/widgets/products/carts/widgets/add_remove_button.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: HomeAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        ///--Items in carts
        child: CartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$250.0'),),
      ),
    );
  }
}
