import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../util/constants.dart' as constants;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String token) async {
    final productFav = isFavorite;
    try {
      isFavorite = !isFavorite;
      notifyListeners();

      final url = '${constants.hostUrl}/products/${id}.json?auth=$token';
      final response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));

      if (response.statusCode >= 400) {
        isFavorite = productFav;
        notifyListeners();
      }
    } catch (error) {
      isFavorite = productFav;
      notifyListeners();
    }
  }
}
