class WeatherEntity {
  final int id;
  final String main;
  final String cityName;
  final String description;
  final int pressure;

  WeatherEntity({
    required this.id,
    required this.main,
    required this.cityName,
    required this.description,
    required this.pressure,
  });
}
