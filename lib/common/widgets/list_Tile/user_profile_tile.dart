import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_images.dart';


class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
   // final dark = THelperFunction.isDarkMode(context);
    return ListTile(
      leading: const CircularImage(
        image: TImages.userProfileTemp,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text('Ankit Dhattarwal', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.whites)),
      subtitle: Text('ankitdhatterwal09@gmail.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.whites)),
      trailing: IconButton(onPressed: onPressed, icon:  const Icon(Iconsax.edit, color:  TColors.whites)),
    );
  }
}
