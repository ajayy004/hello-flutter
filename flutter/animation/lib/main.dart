import 'package:flutter/material.dart';

import './drag_block.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Align(
          alignment: Alignment.bottomCenter,
          child: DragBlock(),
        ),
      ), //MyWidget(),
    );
  }
}
