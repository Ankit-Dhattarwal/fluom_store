import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/features/personalization/screens/carts/widgets/carts_items.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_address_section.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_amount_section.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_payment_section.dart';
import 'package:fluom/navigation_menu.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/carts/widgets/coupon_widget.dart';
import '../../../../common/widgets/success_screen_widget/success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: HomeAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const CartItems(
                showRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtmSections,
              ),

              /// --Coupon TextField
              const CouponCode(),
              const SizedBox(
                height: TSizes.spaceBtmSections,
              ),

              /// --Billing Section
              RoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.whites,
                child: const Column(
                  children: [
                    ///Pricing
                    BillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Payment Method
                    BillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Address
                    BillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() =>  SuccessScreen(
                image: TImages.successPayment,
                title: 'Payment Successfully',
            subTitle: 'Your items will be shipped soon!',
            onPressed: () => Get.offAll( () => const NavigationMenu()),
              ),
          ),
          child: const Text('Checkout \$250.0'),
        ),
      ),
    );
  }
}
