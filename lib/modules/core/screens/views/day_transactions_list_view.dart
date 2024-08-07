import 'package:collection/collection.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:dollar_dash/modules/core/screens/views/transactions_list_view.dart';
import 'package:flutter/material.dart';

class DayTransactionsListView extends StatelessWidget {
  const DayTransactionsListView({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groupBy(transactions, (data) {
        return DateTime(data.date.year, data.date.month, data.date.day);
      })
          .entries
          .sorted((a, b) => a.key.compareTo(b.key))
          .map((dayTransactions) => TransactionsListView(transactions: dayTransactions.value))
          .toList(),
    );
  }
}