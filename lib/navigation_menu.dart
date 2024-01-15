import 'package:fluom/features/personalization/screens/settings/settings.dart';
import 'package:fluom/features/shop/screens/home/widgets/home.dart';
import 'package:fluom/features/shop/screens/store/store.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,  //Here value is used bcz the selectedIndex is the Rx type int so it proper point to the 0 not ,obs
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.dark : Colors.white,
          indicatorColor: dark ? TColors.whites.withOpacity(0.1) : Colors.black.withOpacity(0.1),

          destinations: const[
             NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
             NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
             NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
             NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

/*
not use the setState for the onDestinationSelected bcz this make rebuild
application again for all the button and here we use the Getx power
 */

class NavigationController  extends GetxController{

   final Rx<int> selectedIndex = 0.obs;

   final screens = [ const HomeScreen(), const StoreScreen(), const FavouriteScreen(), const SettingScreen()];
}