import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/configs/router.dart';
import 'package:dollar_dash/modules/core/middleware/home_middleware.dart';
import 'package:dollar_dash/modules/core/models/app_state.dart';
import 'package:dollar_dash/modules/core/models/home_state.dart';
import 'package:dollar_dash/modules/core/reducer/app_state_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

AppState init() => AppState(homeState: HomeState(transactions: []));

loggingMiddleware(Store<AppState> store, action, NextDispatcher next) {
  debugPrint('${DateTime.now()} $action ');
  next(action);
}

class DollarDashApp extends StatelessWidget {
  DollarDashApp({super.key});

  final store = Store<AppState>(appStateReducer,
      initialState: init(), middleware: [loggingMiddleware, homeMiddleware]);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          theme: AppColors.appTheme,
          title: "DollarDash",
        ));
  }
}