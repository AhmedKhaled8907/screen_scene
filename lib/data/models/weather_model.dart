import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scene/domain/entities/weather_entity.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel {
  @JsonKey(name: 'name')
  final String? cityName;
  final List<Weather>? weather;
  final Main? main;
  final int? id;

  WeatherModel({this.cityName, this.weather, this.main, this.id});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  WeatherEntity toEntity() => WeatherEntity(
        id: id ?? 0,
        weatherMain: weather?.first.main ?? '',
        cityName: cityName ?? '',
        description: weather?.first.description ?? '',
        pressure: main?.pressure ?? 0,
      );
}

@JsonSerializable()
class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  final int? pressure;

  Main({this.pressure});

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
