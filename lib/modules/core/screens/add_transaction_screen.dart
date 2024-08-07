import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/actions/add_transaction_action.dart';
import 'package:dollar_dash/modules/core/actions/update_transaction_action.dart';
import 'package:dollar_dash/modules/core/models/app_state.dart';
import 'package:dollar_dash/modules/core/models/enums.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:dollar_dash/shared/utilities.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:redux/redux.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key, this.transaction});

  final Transaction? transaction;

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  double value = 0.0;
  TransactionType? type;
  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return StoreBuilder(onInit: (Store<AppState> store) {
      if (widget.transaction != null) {
        value = widget.transaction!.value;
        type = widget.transaction!.type;
        date = widget.transaction!.date;
      }
    }, builder: (context, Store<AppState> store) {
      return Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            widget.transaction != null ? "Edit Transaction" : "Add Transaction",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: "SC"),
          ),
        ),
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
                if (widget.transaction != null)
                  Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "ID",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColorPrimary,
                              fontFamily: "SC",
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor),
                          child: Text(
                            widget.transaction!.id,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "SC",
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColorPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (widget.transaction != null) const SizedBox(height: 10),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Value",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColorPrimary,
                            fontFamily: "SC",
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: CupertinoSpinBox(
                        incrementIcon: const Icon(
                          CupertinoIcons.add_circled,
                          color: AppColors.iconColor,
                        ),
                        decrementIcon: const Icon(
                          CupertinoIcons.minus_circle,
                          color: AppColors.iconColor,
                        ),
                        min: 0,
                        max: double.infinity,
                        cursorColor: AppColors.textColorPrimary,
                        textStyle: const TextStyle(
                            fontFamily: "SC",
                            fontSize: 16,
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.w600),
                        decimals: 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), color: AppColors.primaryColor),
                        keyboardAppearance: Brightness.dark,
                        textInputAction: TextInputAction.done,
                        // prefix: const Text("Transaction Value"),
                        suffix: const Icon(
                          CupertinoIcons.money_pound,
                          color: AppColors.textColorSecondary,
                        ),
                        onChanged: (val) {
                          setState(() {
                            value = val;
                          });
                        },
                        value: value,
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
                        "Type",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColorPrimary,
                            fontFamily: "SC",
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: DropDownTextField(
                        clearOption: false,
                        dropDownItemCount: 2,
                        dropdownRadius: 10,
                        textFieldDecoration: InputDecoration(
                          hintText: 'Select Type',
                          hintStyle: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: "SC",
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColorSecondary),
                          filled: true,
                          fillColor: AppColors.primaryColor,
                          contentPadding: const EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColors.primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColors.primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        listTextStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "SC",
                            color: AppColors.primaryColor),
                        textStyle: const TextStyle(
                            fontFamily: "SC", fontSize: 16, fontWeight: FontWeight.w600),
                        dropDownList: const [
                          DropDownValueModel(name: 'Deposit', value: TransactionType.deposit),
                          DropDownValueModel(name: 'Withdraw', value: TransactionType.withdraw),
                        ],
                        initialValue: type != null
                            ? type == TransactionType.deposit
                                ? 'Deposit'
                                : 'Withdraw'
                            : null,
                        onChanged: (val) {
                          setState(() {
                            type = val.value as TransactionType;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Date",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textColorPrimary,
                            fontFamily: "SC",
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: InkWell(
                        onTap: () async {
                          List<DateTime?>? dates = await Utilities.selectDate(date);
                          if (dates != null && dates.isNotEmpty && dates.first != null) {
                            setState(() {
                              date = dates.first;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor),
                          child: Text(
                            date != null ? date.toString().split(" ").first : "choose date",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "SC",
                                fontWeight: FontWeight.w600,
                                color: date == null
                                    ? AppColors.textColorSecondary
                                    : AppColors.textColorPrimary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ElevatedButton(
                    onPressed: () {
                      if (isValidData()) {
                        if (widget.transaction == null) {
                          store.dispatch(AddTransactionAction(
                              data: Transaction(
                                  type: type!,
                                  date: date!,
                                  value: value,
                                  id: Utilities.generateTransactionId())));
                        } else {
                          store.dispatch(UpdateTransactionAction(
                              data: Transaction(
                                  type: type!,
                                  date: date!,
                                  value: value,
                                  id: widget.transaction!.id)));
                        }
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(
                            MediaQuery.of(context).size.width * 0.7,
                            MediaQuery.of(context).size.height * 0.05)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            side: const BorderSide(color: AppColors.textColorSecondary, width: 1.2),
                            borderRadius: BorderRadius.circular(10)))),
                    child: Text(
                      widget.transaction != null ? "Save" : "ADD",
                      style: const TextStyle(fontFamily: "SC", color: AppColors.textColorPrimary),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }

  bool isValidData() {
    if (value == 0.0) {
      Utilities.showToast(msg: "Type a valid transaction value please.", isError: true);
      return false;
    } else if (type == null) {
      Utilities.showToast(msg: "Choose the transaction type please.", isError: true);
      return false;
    } else if (date == null) {
      Utilities.showToast(msg: "Choose the transaction date please.", isError: true);
      return false;
    } else {
      return true;
    }
  }
}