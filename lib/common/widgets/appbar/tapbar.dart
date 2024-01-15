import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/devices/device_utility.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreTabBar extends StatelessWidget implements PreferredSizeWidget {

  /// If you want to add background color to tab you have to wrap them in Material widget
  /// To do that we need [PreferredSize] Widget and that's why created custom class [PreferredSizedWidget]
  const StoreTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.whites,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark ? TColors.whites : TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
