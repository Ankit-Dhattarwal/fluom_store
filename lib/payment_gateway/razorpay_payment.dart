
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({super.key});

  @override
  State<RazorPayPage> createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async{
    amount = amount * 100;

    var option = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': 'Fluom Store',
      'prefill': {
        'contact': '+9170152-16280',
        'email': 'ankitdhatterwal09@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try{
      _razorpay.open(option);
    }catch(e){
      debugPrint('Error: e');
    }
  }


  void handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "Payment Successfull"+ response.paymentId!, toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentsError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Payment Fail"+ response.message!, toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet"+ response.walletName!, toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentsError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    
  }
}
