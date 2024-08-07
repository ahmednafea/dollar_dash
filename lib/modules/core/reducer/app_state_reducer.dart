import 'package:dollar_dash/modules/core/models/app_state.dart';

import 'home_reducer.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(

      homeState: homeReducer(state.homeState, action));
}