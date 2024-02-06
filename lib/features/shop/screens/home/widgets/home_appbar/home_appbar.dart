import 'package:fluom/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../common/widgets/shimmers/profile_shimmer_loader.dart';
import '../../../../../../common/widgets/products/carts/widgets/cart_menu_icons.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';

class THomeSecAppBar extends StatelessWidget {
  const THomeSecAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController()); // Here create a new instance
    return HomeAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey),),
          Obx ( ()  {
            if(controller.profileLoading.value){
              // Display a shimmer loader while user profile is being loaded
              return const TShimmerEffect(width: 80, height: 15,);
            } else{
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),);
            }
      },
          ),
        ],
      ),
      actions:  [
        CartCounterIcon(onPressed: (){}, iconColor: TColors.whites,),
      ],
    );
  }
}
