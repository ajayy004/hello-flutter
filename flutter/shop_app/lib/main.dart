import 'package:flutter/material.dart';

import './screens/product_overview.dart';
import './screens/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
