import 'package:dollar_dash/modules/core/models/enums.dart';

class Transaction {
  TransactionType type;
  DateTime date;
  double value;
  String id;

  Transaction({required this.type, required this.date, required this.value, required this.id});
}