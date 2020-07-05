import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_overview.dart';
import './screens/product_detail.dart';
import './providers/products.dart';
import './providers/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Shop App Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: ProductOverViewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
