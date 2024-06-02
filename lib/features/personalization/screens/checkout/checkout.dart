import 'dart:convert';

import 'package:fluom/common/widgets/custom_shape/containers/roundedConatiner.dart';
import 'package:fluom/features/personalization/screens/carts/widgets/carts_items.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_address_section.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_amount_section.dart';
import 'package:fluom/features/personalization/screens/checkout/widgets/billing_payment_section.dart';
import 'package:fluom/navigation_menu.dart';
import 'package:fluom/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/carts/widgets/coupon_widget.dart';
import '../../../../common/widgets/success_screen_widget/success_screen.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'package:http/http.dart'as http;

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  /// -- Add payment gateway
  Map<String, dynamic>? paymentIntent;

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
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(TSizes.defaultSpace),
      //   child: ElevatedButton(
      //     onPressed: () => Get.to(() =>  SuccessScreen(
      //           image: TImages.successPayment,
      //           title: 'Payment Successfully',
      //       subTitle: 'Your items will be shipped soon!',
      //       onPressed: () => Get.offAll( () => const NavigationMenu()),
      //         ),
      //     ),
      //     child: const Text('Checkout \$250.0'),
      //   ),
      // ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => _makePayment(250.0),
          child:  Text('Checkout \$250.0'),
        ),
      ),
    );
  }

Future<void> _makePayment(double amount) async {
  try {
    paymentIntent = await _createPaymentIntent((amount * 100).toInt().toString(), 'USD');

    var gpay = PaymentSheetGooglePay(
      merchantCountryCode: "US",
      currencyCode: "USD",
      testEnv: true,
    );

    // Initialize Payment Sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntent!['client_secret'],
        style: ThemeMode.light,
        merchantDisplayName: 'YourMerchantName',
        googlePay: gpay,
      ),
    );

    // Display Payment Sheet
    await _displayPaymentSheet();
  } catch (err) {
    print(err);
    // Handle error here
  }
}

Future<void> _displayPaymentSheet() async {
  try {
    await Stripe.instance.presentPaymentSheet();
    print("Payment Successfully");
    // Navigate to Success Screen
    Get.to(() => SuccessScreen(
      image: TImages.successPayment,
      title: 'Payment Successfully',
      subTitle: 'Your items will be shipped soon!',
      onPressed: () => Get.offAll(() => const NavigationMenu()),
    ));
  } catch (e) {
    print('$e');
    // Handle error here
  }
}

Future<Map<String, dynamic>> _createPaymentIntent(String amount, String currency) async {
  try {
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
    };

    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer sk_test_51PN19wJcKq48gXJuEGjHnUiAO5EkHpacZRhg1Ro7c3v1zo9IssxfwiouHHEgLCO1qCuyGpmanThX7bK6EXIAiZ2800lp8an3Sl',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );
    return json.decode(response.body);
  } catch (err) {
    throw Exception(err.toString());
  }
}
}
