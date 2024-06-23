part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDarkMode;

  const ThemeState(this.themeData, this.isDarkMode);

  @override
  List<Object?> get props => [themeData, isDarkMode];
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(getThemeDataLight(), false);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(getThemeDataDark(), true);
}
