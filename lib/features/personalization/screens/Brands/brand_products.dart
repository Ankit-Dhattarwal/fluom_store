import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/products/sortable/sortable_products.dart';
import 'package:fluom/features/shop/screens/store/brand_card.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              BrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtmSections,),

             // SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
