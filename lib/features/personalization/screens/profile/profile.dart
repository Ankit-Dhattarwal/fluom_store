import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/common/widgets/images/circular_images.dart';
import 'package:fluom/common/widgets/texts/section_heading.dart';
import 'package:fluom/features/personalization/screens/profile/profile_widgets/profile_menu.dart';
import 'package:fluom/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const CircularImage(image: TImages.userProfileTemp, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
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

              ProfileMenu(title: 'Name', value: 'Ankit Dhattarwal', onPressed: (){},),
              ProfileMenu(title: 'UserName', value: 'Ankit Dhattarwal', onPressed: (){},),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///--Heading Profile Info
              const SectionHeading(title: 'Personal Information', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(title: 'User-ID', value: '0007', icon: Iconsax.copy, onPressed: (){},),
              ProfileMenu(title: 'E-mail', value: 'ankitdhatterwal09@gmail.com', onPressed: (){},),
              ProfileMenu(title: 'Phone Number', value: '+91 7015216280', onPressed: (){},),
              ProfileMenu(title: 'Gender', value: 'Male', onPressed: (){},),
              ProfileMenu(title: 'Date of Birth', value: '07/08/2024', onPressed: (){},),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: (){},
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

