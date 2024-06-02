import 'package:fluom/common/widgets/shimmers/profile_shimmer_loader.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoriesShimmer extends StatelessWidget {
  const TCategoriesShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems,),
          itemBuilder: (_, __) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image
                TShimmerEffect(width: 55, height: 55, radius: 55,),
                SizedBox(height: TSizes.spaceBtwItems / 2,),

                /// Text
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          },
    ),
    );
  }
}
