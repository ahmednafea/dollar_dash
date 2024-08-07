import 'package:dollar_dash/configs/app_assets.dart';
import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/actions/delete_transaction_action.dart';
import 'package:dollar_dash/modules/core/models/app_state.dart';
import 'package:dollar_dash/modules/core/models/enums.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:dollar_dash/shared/components/bottom_sheets/decision_bottom_sheet.dart';
import 'package:dollar_dash/shared/components/expandable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:slideable/slideable.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key, required this.transaction});

  final Transaction transaction;

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(builder: (context, Store<AppState> store) {
      return Container(
        decoration:
            BoxDecoration(color: AppColors.cardColor, borderRadius: BorderRadius.circular(10)),
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
              child: Slideable(
                items: [
                  ActionItems(
                    icon: const Icon(
                      Icons.edit,
                      color: AppColors.accentColor,
                    ),
                    onPress: () {
                      context.pushNamed("addTransaction", extra: widget.transaction);
                    },
                    backgroudColor: Colors.transparent,
                  ),
                  ActionItems(
                    icon: const Icon(
                      Icons.delete,
                      color: AppColors.errorColor,
                    ),
                    onPress: () async {
                      final bool? confirmed = await showModalBottomSheet<bool?>(
                        context: context,
                        backgroundColor: AppColors.primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        builder: (_) {
                          return const DecisionBottomSheet(
                            cancelTxt: null,
                            confirmTxt: "Confirm",
                            note: "Please confirm deleting this transaction from history.",
                            confirmBtnBorderColor: AppColors.textColorSecondary,
                            titleTxtColor: AppColors.textColorPrimary,
                            confirmTxtColor: AppColors.accentColor,
                            confirmBtnColor: AppColors.cardColor,
                            cancelBtnBorderColor: AppColors.textColorSecondary,
                            cancelBtnColor: AppColors.cardColor,
                            cancelTxtColor: AppColors.errorColor,
                            icon: Icon(
                              Icons.delete_forever_outlined,
                              color: AppColors.errorColor,
                              size: 48,
                            ),
                          );
                        },
                      );

                      if (confirmed != null && confirmed) {
                        store.dispatch(DeleteTransactionAction(id: widget.transaction.id));
                      }
                    },
                    backgroudColor: Colors.transparent,
                  ),
                ],
                child: Container(
                  color: AppColors.cardColor,
                  child: Row(
                    children: [
                      Expanded(flex: 4, child: Text(widget.transaction.id)),
                      if (!expanded)
                        Image.asset(
                            widget.transaction.type == TransactionType.deposit
                                ? AppAssets.depositIcn
                                : AppAssets.withdrawIcn,
                            width: 24),
                      if (!expanded)
                        Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Text(widget.transaction.value.toString()),
                                const SizedBox(width: 5),
                                const Icon(
                                  CupertinoIcons.money_pound,
                                  color: AppColors.textColorSecondary,
                                  size: 20,
                                )
                              ],
                            )),
                      Icon(expanded ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded)
                    ],
                  ),
                ),
              ),
            ),
            ExpandedSection(
              expand: expanded,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Value:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColorSecondary,
                              fontFamily: "SC",
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Text(widget.transaction.value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorPrimary,
                                    fontFamily: "SC",
                                    fontSize: 16)),
                            const SizedBox(width: 5),
                            const Icon(
                              CupertinoIcons.money_pound,
                              color: AppColors.textColorSecondary,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Type:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColorSecondary,
                              fontFamily: "SC",
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Text(
                                widget.transaction.type == TransactionType.deposit
                                    ? "Deposit"
                                    : "Withdraw",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColorPrimary,
                                    fontFamily: "SC",
                                    fontSize: 16)),
                            Image.asset(
                                widget.transaction.type == TransactionType.deposit
                                    ? AppAssets.depositIcn
                                    : AppAssets.withdrawIcn,
                                width: 24),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Date:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColorSecondary,
                              fontFamily: "SC",
                              fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Text(widget.transaction.date.toString().split(" ").first,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColorPrimary,
                                fontFamily: "SC",
                                fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}