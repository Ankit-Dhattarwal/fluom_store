import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/home_controllers.dart';
import '../../../../utils/constants/sizes.dart';
import '../products_cart/product_card_vertical.dart';

class SortableProducts extends StatelessWidget {
  SortableProducts({super.key});
  final homeController = Get.put(HomeController());
  final RxString selectedSortOption = 'None'.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          value: 'None',
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {
            selectedSortOption.value = value!;
            homeController.updateSortedProductList(value);
          },
          items: [
            'None',
            'All',
            'Higher Price',
            'Lower Price',
          ]
              .map((option) => DropdownMenuItem(
            value: option,
            child: Text(option),
          ))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtmSections),
        /// Products
        Obx(() {
          if (homeController.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> productsToShow = homeController.sortedProducts;
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: MediaQuery.of(context).size.width / 600,
              ),
              itemCount: productsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                final product = productsToShow[index].data() as Map<String, dynamic>;
                final productId = productsToShow[index].id;
                final categoryName = productId.split('-').first;
                return ProductCardVertical(
                  productName: product['name'],
                  productImage: product['Image'],
                  productPrice: product['Price'],
                  productDetails: product['Details'],
                  productId: categoryName,
                  index: index,
                );
              },
            );
          }
        }),
      ],
    );
  }
}
