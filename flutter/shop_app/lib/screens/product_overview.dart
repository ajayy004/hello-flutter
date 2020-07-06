import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';

import '../widgets/product_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool _showOnlyFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          Consumer<Cart>(
            builder: (ctx, cart, child) => Text("${cart.cartItemCount}"),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedVal) {
              setState(() {
                if (selectedVal == FilterOptions.Favorites) {
                  _showOnlyFavorite = true;
                } else {
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Shoow All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductGrid(_showOnlyFavorite),
    );
  }
}
