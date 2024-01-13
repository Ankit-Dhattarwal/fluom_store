import 'package:flutter/material.dart';

import '../../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../../common/widgets/products/products_cart/cart_menu_icons.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/text_strings.dart';

class THomeSecAppBar extends StatelessWidget {
  const THomeSecAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HomeAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey),),
          Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
        ],
      ),
      actions:  [
        CartCounterIcon(onPressed: (){}, iconColor: TColors.whites,),
      ],
    );
  }
}
