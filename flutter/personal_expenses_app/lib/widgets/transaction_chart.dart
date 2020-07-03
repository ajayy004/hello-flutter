import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTranasctions;

  TransactionChart(this.recentTranasctions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double total = 0;

      for (var i = 0; i < recentTranasctions.length; i++) {
        if (recentTranasctions[i].date.day == weekDay.day &&
            recentTranasctions[i].date.month == weekDay.month &&
            recentTranasctions[i].date.year == weekDay.year) {
          total += recentTranasctions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': total,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (previousValue, item) {
      return previousValue + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(
            data['day'],
            data['amount'],
            totalSpending == 0.0
                ? totalSpending
                : (data['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
