import 'package:screen_scene/domain/entities/weather_entity.dart';
import 'package:screen_scene/domain/repos/weather_repo.dart';

class GetWeatherByCityNameUseCase {
  final WeatherRepo weatherRepo;

  GetWeatherByCityNameUseCase({required this.weatherRepo});

  Future<WeatherEntity> call({required String cityName}) {
    return weatherRepo.getWeatherByCityName(cityName: cityName);
  }
}