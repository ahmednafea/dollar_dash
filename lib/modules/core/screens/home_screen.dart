import 'package:dollar_dash/configs/app_assets.dart';
import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/models/app_state.dart';
import 'package:dollar_dash/modules/core/screens/views/day_transactions_list_view.dart';
import 'package:dollar_dash/shared/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      onInitialBuild: (Store<AppState> store) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
      builder: (BuildContext ctx, Store<AppState> store) {
        return Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "DollarDash",
                style: TextStyle(
                    color: AppColors.textColorPrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontFamily: "SC"),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pushNamed("addTransaction");
                    },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            side: const BorderSide(color: AppColors.textColorSecondary, width: 1.2),
                            borderRadius: BorderRadius.circular(10)))),
                    child: const Row(
                      children: [
                        Text(
                          "ADD",
                          style: TextStyle(
                              fontFamily: "SC",
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: AppColors.textColorPrimary),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.add, color: AppColors.textColorPrimary),
                      ],
                    )),
                const SizedBox(width: 10)
              ],
              backgroundColor: Colors.transparent),
          extendBodyBehindAppBar: true,
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColors.scaffoldBackgroundColor,
                AppColors.primaryColor,
                AppColors.cardColor,
                AppColors.dividerColor,
              ],
            )),
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 60, bottom: 20, left: 10, right: 10),
              child: Column(
                children: [
                  Card(
                    elevation: 3,
                    color: AppColors.cardColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "BALANCE",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.textColorSecondary,
                                    fontFamily: "SC",
                                    fontWeight: FontWeight.w600),
                              )),
                              Icon(Icons.account_balance_wallet_rounded)
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "${Utilities.getTotalBalance(store.state.homeState.transactions)}",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: AppColors.textColorPrimary,
                                      fontFamily: "SC",
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Icon(
                                CupertinoIcons.money_pound,
                                color: AppColors.textColorSecondary,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 3,
                          color: AppColors.cardColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "INCOME",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.textColorSecondary,
                                            fontFamily: "SC",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor,
                                          fontFamily: "SC",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${Utilities.getIncomeBalance(store.state.homeState.transactions)}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.textColorPrimary,
                                            fontFamily: "SC",
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Icon(
                                      CupertinoIcons.money_pound,
                                      color: AppColors.textColorSecondary,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 3,
                          color: AppColors.cardColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "EXPENSES",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.textColorSecondary,
                                            fontFamily: "SC",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.errorColor,
                                          fontFamily: "SC",
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${Utilities.getExpensesBalance(store.state.homeState.transactions)}",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: AppColors.textColorPrimary,
                                            fontFamily: "SC",
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const Icon(
                                      CupertinoIcons.money_pound,
                                      color: AppColors.textColorSecondary,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Transactions",
                    style: TextStyle(fontFamily: "SC", fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  store.state.homeState.transactions.isNotEmpty
                      ? DayTransactionsListView(transactions: store.state.homeState.transactions)
                      : Center(
                          child: Column(
                            children: [
                              Image.asset(
                                AppAssets.noHistory,
                                width: MediaQuery.of(context).size.width * 0.6,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "There Are No Transactions Yet.",
                                style: TextStyle(
                                    fontFamily: "SC", fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              TextButton(
                                  onPressed: () {
                                    context.pushNamed("addTransaction");
                                  },
                                  style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)))),
                                  child: const Text(
                                    "Add Transaction",
                                    style: TextStyle(
                                        fontFamily: "SC",
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.textColorPrimary),
                                  )),
                            ],
                          ),
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}