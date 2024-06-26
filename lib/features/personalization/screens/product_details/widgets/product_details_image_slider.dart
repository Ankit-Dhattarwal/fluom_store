import 'package:fluom/common/widgets/images/rounded_image_only_Network.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/Icons/circular_icons.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shape/curved_edges/curved_edge_widget.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';


class ProductImageSlider extends StatelessWidget {
  final String imageUrl;
  const ProductImageSlider({
    super.key, required this.imageUrl,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return CurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child:  Stack(
          children: [
            ///--Main Large Image
             SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImagesRadius * 2),
                child: Center(
                  child: RounderImageNetwork(
                    imageUrl: imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
                  itemCount: 4,
                  itemBuilder: (_, index) => RounderImageNetwork(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.whites,
                    imageUrl: imageUrl,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                ),
              ),
            ),

            /// AppBar Icons
            const HomeAppBar(
              showBackArrow: true,
              actions: [
                CircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
