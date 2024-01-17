import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/common/widgets/products/ratings/ratings_indicator.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/constants/sizes.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/image_strings.dart';

class UserReviewsCard extends StatelessWidget {
  const UserReviewsCard({super.key});

  @override
  Widget build(BuildContext context) {

    final dark = THelperFunction.isDarkMode(context);
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(TImages.userProfileReview1),),
                const SizedBox(width: TSizes.spaceBtwItems,),
                Text('Ankit Dhattarwal', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Reviews
        Row(
          children: [
            const MyRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Jan 2024', style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        const ReadMoreText(
            'This really helped me fill in the blanks on a new site. It quickly put mock data in place so my customer could "see" how things would look before we opened for business. Well worth the price!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),

        /// Company Reviews
        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child:  Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Fluom Store', style: Theme.of(context).textTheme.titleMedium,),
                    Text('02 Jan 2024', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  'This really helped me fill in the blanks on a new site. It quickly put mock data in place so my customer could "see" how things would look before we opened for business. Well worth the price!',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),

          ),
        ),
        const SizedBox(height: TSizes.spaceBtmSections,),
      ],
    );
  }
}
