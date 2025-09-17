import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:screen_scene/core/utils/app_constants.dart';
import 'package:screen_scene/data/models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel?> getWeatherByCityName({
    required String cityName,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  Future<WeatherModel?> getWeatherByCityName({
    required String cityName,
  }) async {
    try {
      final response = await Dio().get(
        '${AppConstants.baseUrl}?q=$cityName&appid=${AppConstants.apiKey}',
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
