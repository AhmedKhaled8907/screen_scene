part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDarkMode;

  const ThemeState(this.themeData, this.isDarkMode);

  @override
  List<Object?> get props => [themeData, isDarkMode];
}

class LightThemeState extends ThemeState {
  final ThemeMode themeMode;

  LightThemeState(this.themeMode) : super(getThemeDataLight(), false);
}

class DarkThemeState extends ThemeState {
  final ThemeMode themeMode;

  DarkThemeState(this.themeMode) : super(getThemeDataDark(), true);
}
