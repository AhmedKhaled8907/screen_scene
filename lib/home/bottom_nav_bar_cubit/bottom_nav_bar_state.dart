part of 'bottom_nav_bar_cubit.dart';

sealed class BottomNavBarState {
  final Widget currentView;
  const BottomNavBarState(this.currentView);
}

final class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial(super.initialView);
}

class ChangeCurrentIndexState extends BottomNavBarState {
  const ChangeCurrentIndexState(super.currentView);
}
