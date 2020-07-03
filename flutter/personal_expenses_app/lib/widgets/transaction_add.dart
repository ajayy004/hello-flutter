import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAdd extends StatefulWidget {
  final Function addNewTransaction;

  TransactionAdd(this.addNewTransaction);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  void submit() {
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              onSubmitted: (_) => submit(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountControler,
              onSubmitted: (_) => submit(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).accentColor,
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }
}
