import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/images/circular_images.dart';
import 'package:fluom/common/widgets/shimmers/profile_shimmer_loader.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/features/personalization/controllers/user_controller.dart';
import 'package:fluom/features/personalization/screens/profile/profile_widgets/change_name.dart';
import 'package:fluom/features/personalization/screens/profile/profile_widgets/profile_menu.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return  Scaffold(
      appBar: const HomeAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),

      ///-- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///--Profile Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx( (){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.userProfileTemp;
                      return  controller.imageUploading.value
                        ? const TShimmerEffect(width: 80, height: 80, radius: 80,)
                        : CircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              /// Details
              const SizedBox(height: TSizes.spaceBtwItems / 2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              ///--Heading Profile Info
              const SectionHeading(title: 'Profile Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(() => const ChangeName()),),
              ProfileMenu(title: 'UserName', value: controller.user.value.username, onPressed: (){},),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///--Heading Profile Info
              const SectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'User-ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: (){},),
              ProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: (){},),
              ProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: (){},),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
              ProfileMenu(title: 'Date of Birth', value: '07/08/2024', onPressed: (){},),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account' , style: TextStyle(color: Colors.red),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

