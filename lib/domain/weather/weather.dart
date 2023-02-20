import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/current_weather/current_weather.dart';
import 'package:the_weather/domain/weather/forecast/forecast.dart';
import 'package:the_weather/domain/weather/location/location.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    Location? location,
    CurrentWeather? current,
    Forecast? forecast,
  }) = _Weather;

  factory Weather.empty() => Weather(
        location: Location.empty(),
        current: CurrentWeather.empty(),
        forecast: Forecast.empty(),
      );
}
