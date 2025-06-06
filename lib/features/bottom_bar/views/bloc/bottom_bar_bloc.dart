import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_bar_events.dart';
import 'bottom_bar_states.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(HomePageState()) {
    on<NavigateToPage>((event, emit) {
      switch (event.index) {
        case 0:
          emit(HomePageState());
          break;
        case 1:
          emit(CartPageState());
          break;
        case 2:
          emit(SettingsPageState());
          break;
      }
    });
  }
}
