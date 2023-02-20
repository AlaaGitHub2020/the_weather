import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/forecastday/forecastday.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    List<Forecastday?>? forecastday,
  }) = _Forecast;

  factory Forecast.empty() => const Forecast(
        forecastday: [],
      );
}
