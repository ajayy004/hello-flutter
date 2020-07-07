import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: ordersProvider.orders.length,
        itemBuilder: (ctx, i) => OrderItem(
          ordersProvider.orders[i],
        ),
      ),
    );
  }
}
