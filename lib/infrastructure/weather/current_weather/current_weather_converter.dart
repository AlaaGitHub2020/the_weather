import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/current_weather/current_weather.dart';
import 'package:the_weather/infrastructure/weather/current_weather/current_weather_data_transfer_object.dart';

class CurrentWeatherConverter
    implements JsonConverter<CurrentWeather?, Map<String, dynamic>> {
  const CurrentWeatherConverter();

  @override
  CurrentWeather? fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(CurrentWeather? currentWeather) =>
      CurrentWeatherDto().toJson();
}
