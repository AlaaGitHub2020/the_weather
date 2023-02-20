import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/current_weather/current_weather.dart';
import 'package:the_weather/domain/weather/forecast/forecast.dart';
import 'package:the_weather/domain/weather/location/location.dart';
import 'package:the_weather/domain/weather/weather.dart';
import 'package:the_weather/infrastructure/weather/current_weather/current_weather_converter.dart';
import 'package:the_weather/infrastructure/weather/current_weather/current_weather_data_transfer_object.dart';
import 'package:the_weather/infrastructure/weather/forecast/forecast_converter.dart';
import 'package:the_weather/infrastructure/weather/forecast/forecast_data_transfer_object.dart';
import 'package:the_weather/infrastructure/weather/location/location_converter.dart';
import 'package:the_weather/infrastructure/weather/location/location_data_transfer_object.dart';

part 'weather_data_transfer_object.freezed.dart';

part 'weather_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class WeatherDto with _$WeatherDto {
  factory WeatherDto({
    @LocationConverter() Location? location,
    @CurrentWeatherConverter() CurrentWeather? current,
    @ForecastConverter() Forecast? forecast,
  }) = _WeatherDto;

  factory WeatherDto.fromDomain(Weather? weather) {
    return WeatherDto(
      current: weather!.current,
      location: weather.location,
      forecast: weather.forecast,
    );
  }

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);
}

extension WeatherDtoX on WeatherDto {
  Weather? toDomain() {
    return Weather(
      current: CurrentWeatherDto.fromDomain(current).toDomain(),
      location: LocationDto.fromDomain(location).toDomain(),
      forecast: ForecastDto.fromDomain(forecast).toDomain(),
    );
  }
}
