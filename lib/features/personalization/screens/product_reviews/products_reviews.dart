import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/features/personalization/screens/product_reviews/widgets/progress_indicator_and_ratings.dart';
import 'package:fluom/features/personalization/screens/product_reviews/widgets/ratings_progress_indicator.dart';
import 'package:fluom/features/personalization/screens/product_reviews/widgets/user_reviews_card.dart';
import 'package:fluom/utils/constants/colors.dart';
import 'package:fluom/utils/devices/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/ratings/ratings_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// Appbar
      appBar: HomeAppBar(
        showBackArrow: true,
        title: Text('Reviews & Ratings'),
      ),

      /// --Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use the same type of devices that are you use.'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Products Ratings
              const OverallProductRatings(),
              const MyRatingBarIndicator(rating: 3.5,),
              Text('12,655', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtmSections,),

              /// User Reviews List
              const UserReviewsCard(),
              const UserReviewsCard(),

            ],
          ),
        ),
      ),
    );
  }
}
