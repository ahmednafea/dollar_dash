import 'package:dollar_dash/modules/core/actions/add_transaction_action.dart';
import 'package:dollar_dash/modules/core/actions/delete_transaction_action.dart';
import 'package:dollar_dash/modules/core/actions/update_transaction_action.dart';
import 'package:dollar_dash/modules/core/middleware/navigation_key.dart';
import 'package:dollar_dash/modules/core/models/home_state.dart';

HomeState homeReducer(HomeState state, action) {
  if (action is AddTransactionAction) {
    state.transactions.add(action.data);
    navigatorKey.currentState!.pop();
    return state.copyWith(transactions: state.transactions);
  } else if (action is UpdateTransactionAction) {
    int index =
        state.transactions.lastIndexWhere((transaction) => transaction.id == action.data.id);
    if (index != -1) {
      state.transactions.removeAt(index);
      state.transactions.insert(index, action.data);
    }
    navigatorKey.currentState!.pop();
    return state.copyWith(transactions: state.transactions);
  } else if (action is DeleteTransactionAction) {
    state.transactions.removeWhere((transaction) => transaction.id == action.id);

    return state.copyWith(transactions: state.transactions);
  }
  return state;
}