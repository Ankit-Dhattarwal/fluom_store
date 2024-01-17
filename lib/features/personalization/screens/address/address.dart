import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: TColors.primary,
      floatingActionButton: FloatingActionButton(onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child:  const Icon(Iconsax.add, color: TColors.whites),
        ),
      appBar: HomeAppBar(
        showBackArrow: true,

      ),
    );
  }
}
