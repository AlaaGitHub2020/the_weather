import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/weather_value_failure.dart';

part 'failures.freezed.dart';

@freezed
class Failure<T> with _$Failure<T> {
  const factory Failure.weather(WeatherValueFailure<T> failure) = _Weather<T>;
}
