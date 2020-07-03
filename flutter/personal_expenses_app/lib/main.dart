import 'package:flutter/material.dart';
import './widgets/transaction_chart.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_add.dart';
import './models/transaction.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransaction = [];

  void _addNewTransaction(String title, double amount) {
    final newTxn = Transaction(
      id: '${_userTransaction.length + 1}',
      amount: amount,
      title: title,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTxn);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet<void>(
      // context: ctx,
      // builder: (BuildContext context) {
      //   return TransactionAdd(_addNewTransaction);
      // },
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TransactionAdd(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.deepOrange,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses App"),
          actions: <Widget>[
            Builder(
                builder: (bContext) => IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => _startNewTransaction(bContext),
                    )),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TransactionChart(),
              TransactionList(_userTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (bContext) => FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => _startNewTransaction(bContext),
          ),
        ),
      ),
    );
  }
}
