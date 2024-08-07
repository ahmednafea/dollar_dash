import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:dollar_dash/modules/core/screens/views/transaction_view.dart';
import 'package:dollar_dash/shared/components/expandable_widget.dart';
import 'package:dollar_dash/shared/utilities.dart';
import 'package:flutter/material.dart';

class TransactionsListView extends StatefulWidget {
  const TransactionsListView({super.key, required this.transactions});

  final List<Transaction> transactions;

  @override
  State<TransactionsListView> createState() => _TransactionsListViewState();
}

class _TransactionsListViewState extends State<TransactionsListView> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.textColorSecondary)),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      Utilities.getDateFormated(widget.transactions.first.date),
                      style: const TextStyle(
                          fontFamily: "SC",
                          color: AppColors.textColorSecondary,
                          letterSpacing: 0,
                          fontSize: 14),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(
                      "Total: ${Utilities.getTotalBalance(widget.transactions)} £",
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          fontFamily: "SC",
                          color: AppColors.textColorSecondary,
                          letterSpacing: 0.03,
                          fontSize: 14),
                    ))
                  ],
                )),
                Icon(expanded ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded)
              ],
            ),
          ),
          ExpandedSection(
            expand: expanded,
            child: Column(
              children: [
                ...widget.transactions
                    .map((transaction) => TransactionView(transaction: transaction)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}