import 'package:fluom/common/widgets/appbar/appbar.dart';
import 'package:fluom/features/personalization/screens/order/widgets/order_list.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      ///--AppBar
      appBar: HomeAppBar(
        title: Text('My Order', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const Padding(padding: EdgeInsets.all(TSizes.defaultSpace),

        /// --Orders
        child: OrderListItems(),
      ),
    );
  }
}
