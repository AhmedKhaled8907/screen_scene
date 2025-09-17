class WeatherEntity {
  final int id;
  final String weatherMain;
  final String cityName;
  final String description;
  final int pressure;

  WeatherEntity({
    required this.id,
    required this.weatherMain,
    required this.cityName,
    required this.description,
    required this.pressure,
  });
}
