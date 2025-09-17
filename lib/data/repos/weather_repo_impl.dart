import 'package:screen_scene/data/data_source/remote_data_source.dart';
import 'package:screen_scene/domain/entities/weather_entity.dart';
import 'package:screen_scene/domain/repos/weather_repo.dart';

class WeatherRepoImpl implements WeatherRepo {
  final RemoteDataSource remoteDataSource;

  WeatherRepoImpl({required this.remoteDataSource});

  @override
  Future<WeatherEntity> getWeatherByCityName({
    required String cityName,
  }) async {
    final weatherModel = await remoteDataSource.getWeatherByCityName(
      cityName: cityName,
    );
    return weatherModel!.toEntity();
  }
}
