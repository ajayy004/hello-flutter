import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart; //will import only Cart class
import '../widgets/cart_item.dart' as ci;
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cartItemsValue = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvider.totalAmount}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cartProvider.items.values.toList(),
                        cartProvider.totalAmount,
                      );
                      cartProvider.clearCart();
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.items.length,
              itemBuilder: (ctx, i) => ci.CartItem(
                cartItemsValue[i].id,
                cartProvider.items.keys.toList()[i],
                cartItemsValue[i].title,
                cartItemsValue[i].price,
                cartItemsValue[i].quantity,
                cartProvider.removeItem,
              ),
            ),
          )
        ],
      ),
    );
  }
}
