import 'package:fluom/common/widgets/Icons/circular_icons.dart';
import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/layout/grid_layout.dart';
import 'package:fluom/common/widgets/products/products_cart/product_card_vertical.dart';
import 'package:fluom/features/shop/screens/home/widgets/home.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => Get.to( HomeScreen()),)
        ],
      ),
      body:  SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // GridLayout(itemCount: 4, itemBuilder: (_, index) =>  ProductCardVertical(index: index, productDetails: null, productPrice: null, productImage: null, productName: null,))
            ],
          ),
        ),
      ),
    );
  }
}
