import 'package:screen_scene/domain/entities/weather_entity.dart';

abstract class WeatherRepo {
  Future<WeatherEntity> getWeatherByCityName({required String cityName});
}
