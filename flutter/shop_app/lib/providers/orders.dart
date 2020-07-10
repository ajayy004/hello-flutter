import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import './cart.dart';
import '../util/constants.dart' as constants;

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.product,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  String authToken;
  List<OrderItem> _orders = [];

  Orders(this.authToken, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> getOrders() async {
    try {
      final url = '${constants.hostUrl}/orders.json?auth=$authToken';
      final response = await http.get(url);
      final List<OrderItem> loadedOrders = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      if (extractedData == null) {
        return;
      }

      extractedData.forEach(
        (ordId, ord) {
          loadedOrders.add(
            OrderItem(
              id: ordId,
              amount: ord['amount'],
              dateTime: DateTime.parse(ord['dateTime']),
              product: (ord['products'] as List<dynamic>)
                  .map(
                    (item) => CartItem(
                      id: item['id'],
                      price: item['price'],
                      quantity: item['quantity'],
                      title: item['title'],
                    ),
                  )
                  .toList(),
            ),
          );
        },
      );
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    try {
      final timestamp = DateTime.now();
      final url = '${constants.hostUrl}/orders.json?auth=$authToken';
      print(url);

      final response = await http.post(
        url,
        body: json.encode({
          "amount": total,
          "dateTime": timestamp.toIso8601String(),
          "products": cartProducts
              .map((cp) => {
                    "id": cp.id,
                    "title": cp.title,
                    "price": cp.price,
                    "quantity": cp.quantity,
                  })
              .toList()
        }),
      );

      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['name'],
          amount: total,
          product: cartProducts,
          dateTime: DateTime.now(),
        ),
      );
      notifyListeners();
    } catch (error) {
      print(error.toString);
      throw error;
    }
  }
}
