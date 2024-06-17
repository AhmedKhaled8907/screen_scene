import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_dark.dart';
import 'package:movies_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(DarkThemeState()) {
    // Dispatch LoadThemeEvent when the Bloc is created
    // add(LoadThemeEvent());

    on<ToggleThemeEvent>(_onToggleThemeEvent);
    on<LoadThemeEvent>(_onLoadThemeEvent);
  }

  Future<void> _onToggleThemeEvent(
      ToggleThemeEvent event, Emitter<ThemeState> emit) async {
    if (state is LightThemeState) {
      emit(DarkThemeState());
      await _saveTheme('dark');
    } else {
      emit(LightThemeState());
      await _saveTheme('light');
    } 
  }

  Future<void> _onLoadThemeEvent(
      LoadThemeEvent event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme') ?? 'dark';
    if (theme == 'dark') {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  Future<void> _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
  }
}
