import 'package:flutter/material.dart';

class TransactionChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20),
      child: Card(
        color: Theme.of(context).primaryColor,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Transaction Chart',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 5,
      ),
    );
  }
}
