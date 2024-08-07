import 'package:dollar_dash/modules/core/models/transaction_model.dart';

class HomeState {
  HomeState({required this.transactions});

  List<Transaction> transactions;

  HomeState copyWith({List<Transaction>? transactions}) {
    return HomeState(transactions: transactions ?? this.transactions);
  }
}