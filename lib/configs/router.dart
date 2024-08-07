import 'package:dollar_dash/modules/core/middleware/navigation_key.dart';
import 'package:dollar_dash/modules/core/models/transaction_model.dart';
import 'package:dollar_dash/modules/core/screens/add_transaction_screen.dart';
import 'package:dollar_dash/modules/core/screens/home_screen.dart';
import 'package:dollar_dash/modules/core/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          name: "home",
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'add_transaction',
          name: "addTransaction",
          builder: (BuildContext context, GoRouterState state) {
            Transaction? transaction = state.extra as Transaction?;
            return AddTransactionScreen(
              transaction: transaction,
            );
          },
        ),
      ],
    ),
  ],
);