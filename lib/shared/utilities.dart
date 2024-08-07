import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/middleware/navigation_key.dart';
import 'package:dollar_dash/modules/core/models/enums.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utilities {
  static showToast({required String msg, Toast? length, required bool isError}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: isError ? Colors.red : AppColors.primaryColor,
        toastLength: length ?? Toast.LENGTH_LONG,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static String generateTransactionId() {
    // Get the current date and time
    final DateTime now = DateTime.now();

    // Format the date and time as a string (YYYYMMDDHHMMSS)
    final String formattedDate =
        '${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}${_twoDigits(now.hour)}${_twoDigits(now.minute)}${_twoDigits(now.second)}';

    // Generate a random number between 1000 and 9999
    final Random random = Random();
    final int randomNumber = 1000 + random.nextInt(9000);

    // Combine the date and random number to create the transaction ID
    final String transactionId = '$formattedDate$randomNumber';

    return transactionId;
  }

  static String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }

  static double getTotalBalance(List<Transaction> transactions) {
    double val = 0.0;
    for (Transaction transaction in transactions) {
      if (transaction.type == TransactionType.deposit) {
        val += transaction.value;
      } else {
        val -= transaction.value;
      }
    }
    return val;
  }

  static double getIncomeBalance(List<Transaction> transactions) {
    double val = 0.0;
    for (Transaction transaction
        in transactions.where((value) => value.type == TransactionType.deposit)) {
      val += transaction.value;
    }
    return val;
  }

  static double getExpensesBalance(List<Transaction> transactions) {
    double val = 0.0;
    for (Transaction transaction
        in transactions.where((value) => value.type == TransactionType.withdraw)) {
      val += transaction.value;
    }
    return val;
  }
  static Future<List<DateTime?>?> selectDate(DateTime? date) async {
    List<DateTime?>? results = await showCalendarDatePicker2Dialog(
      context: navigatorKey.currentContext!,
      config: CalendarDatePicker2WithActionButtonsConfig(
          currentDate: date,
          daySplashColor: AppColors.textColorSecondary,
          firstDayOfWeek: 6,
          dayBorderRadius: BorderRadius.circular(10),
          selectedDayTextStyle: const TextStyle(
              color: AppColors.primaryColor,
              fontFamily: "SC",
              fontWeight: FontWeight.w600,
              fontSize: 14),
          selectedMonthTextStyle: const TextStyle(
              color: AppColors.textColorPrimary,
              fontFamily: "SC",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          selectedYearTextStyle: const TextStyle(
              color: AppColors.textColorPrimary,
              fontFamily: "SC",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          yearTextStyle: const TextStyle(
            color: AppColors.textColorSecondary,
            fontFamily: "SC",
            fontWeight: FontWeight.w500,
          ),
          dayTextStyle: const TextStyle(
            color: AppColors.textColorSecondary,
            fontFamily: "SC",
            fontWeight: FontWeight.w500,
          ),
          animateToDisplayedMonthDate: true,
          yearBorderRadius: BorderRadius.circular(10),
          monthBorderRadius: BorderRadius.circular(10),
          selectedDayHighlightColor: AppColors.textColorPrimary,
          controlsTextStyle: const TextStyle(
              color: AppColors.textColorSecondary,
              fontSize: 13,
              fontFamily: "SC"),
          todayTextStyle: const TextStyle(
            color: AppColors.textColorSecondary,
            fontFamily: "SC",
            fontWeight: FontWeight.w500,
          ),
          weekdayLabelTextStyle: const TextStyle(
              color: AppColors.textColorSecondary,
              fontFamily: "SC",
              fontWeight: FontWeight.w600),
          monthTextStyle: const TextStyle(
              color: AppColors.textColorSecondary,
              fontFamily: "SC",
              fontWeight: FontWeight.w600),
          okButtonTextStyle: const TextStyle(
              color: AppColors.textColorPrimary,
              fontFamily: "SC",
              fontWeight: FontWeight.w600,
              fontSize: 16),
          cancelButtonTextStyle: const TextStyle(
              color: AppColors.textColorSecondary,
              fontFamily: "SC",
              fontWeight: FontWeight.w500,
              fontSize: 16)),
      dialogSize: const Size(325, 400),
      value: [date],
      dialogBackgroundColor: AppColors.cardColor,
      useSafeArea: true,
      borderRadius: BorderRadius.circular(10),
    );
    return results;
  }
  static String getDateFormated(DateTime date) {
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      return "Today";
    } else if (date.year == yesterday.year && yesterday.month == yesterday.month && date.day == yesterday.day) {
      return "Yesterday";
    } else {
      return DateFormat('EEE d of MMM, yyyy', "en").format(date);
    }
  }

}