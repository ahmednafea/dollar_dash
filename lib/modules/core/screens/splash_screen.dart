import 'package:dollar_dash/configs/app_assets.dart';
import 'package:dollar_dash/configs/app_colors.dart';
import 'package:dollar_dash/modules/core/models/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:redux/redux.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      onInit: (Store<AppState> store) async {
        initializeDateFormatting("en");
      },
      onInitialBuild: (Store<AppState> store) async {
        Future.delayed(const Duration(seconds: 3), () {
          context.pushReplacementNamed("home");
        });
      },
      builder: (BuildContext ctx, Store<AppState> store) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                AppAssets.logoImg,
                height: MediaQuery.of(context).size.height * 0.33,
              ),
            ),
          ),
        );
      },
    );
  }
}