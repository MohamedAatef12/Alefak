import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  int get index;

  @override
  List<Object> get props => [];
}

class HomePageState extends BottomNavigationState {
  @override
  int get index => 0;
}

class CartPageState extends BottomNavigationState {
  @override
  int get index => 1;
}

class SettingsPageState extends BottomNavigationState {
  @override
  int get index => 2;
}
