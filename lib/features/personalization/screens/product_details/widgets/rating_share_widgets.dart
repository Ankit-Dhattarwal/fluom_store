import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';


class RatingShare extends StatelessWidget {
  final double rating;
  final int count;
  const RatingShare({
    super.key, required this.rating, required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24,),
            const SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text.rich(
              TextSpan(
                  children:[
                    TextSpan(text: rating.toString(), style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: '(' + count.toString()+ ')'),
                  ]
              ),
            ),
          ],
        ),
        /// Share Button
        IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: TSizes.iconsMd,))
      ],
    );
  }
}
