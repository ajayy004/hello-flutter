import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import './widgets/transaction_chart.dart';
import './widgets/transaction_list.dart';
import './widgets/transaction_add.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransaction = [];
  bool showChart = true;

  List<Transaction> get _recentTranasction {
    return _userTransaction.where((txn) {
      return txn.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
    String title,
    double amount,
    DateTime choosenDate,
  ) {
    final newTxn = Transaction(
      id: DateTime.now().toString(),
      amount: amount,
      title: title,
      date: choosenDate,
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

  void _deleteTransaction(String txnId) {
    setState(() {
      _userTransaction.removeWhere((txn) => txn.id == txnId);
    });
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
              button: TextStyle(
                color: Colors.white,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart'),
                  Switch.adaptive(
                    value: showChart,
                    onChanged: (val) {
                      setState(() {
                        showChart = val;
                      });
                    },
                  ),
                ],
              ),
              TransactionChart(_recentTranasction),
              TransactionList(_userTransaction, _deleteTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Platform.isIOS
            ? Container()
            : Builder(
                builder: (bContext) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => _startNewTransaction(bContext),
                ),
              ),
      ),
    );
  }
}
