import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState(ThemeMode.system)) {
    on<ToggleThemeEvent>(_onToggleThemeEvent);
    on<LightThemeEvent>(_onLightThemeEvent);
    on<DarkThemeEvent>(_onDarkThemeEvent);
    on<LoadThemeEvent>(_onLoadThemeEvent);
  }

  Future<void> _onLightThemeEvent(
      LightThemeEvent event, Emitter<ThemeState> emit) async {
    if (state is DarkThemeState) {
      emit(LightThemeState(ThemeMode.light));
      await _saveTheme('light');
    }
  }

  Future<void> _onDarkThemeEvent(
      DarkThemeEvent event, Emitter<ThemeState> emit) async {
    if (state is LightThemeState) {
      emit(DarkThemeState(ThemeMode.dark));
      await _saveTheme('dark');
    }
  }

  Future<void> _onToggleThemeEvent(
      ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    if (state is LightThemeState) {
      emit(DarkThemeState(ThemeMode.dark));
      await _saveTheme('dark');
    } else if (state is DarkThemeState) {
      emit(LightThemeState(ThemeMode.light));
      await _saveTheme('light');
    }
  }

  Future<void> _onLoadThemeEvent(
      LoadThemeEvent event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'dark';
    if (theme == 'dark') {
      emit(DarkThemeState(ThemeMode.dark));
    } else {
      emit(LightThemeState(ThemeMode.light));
    }
  }

  Future<void> _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}
