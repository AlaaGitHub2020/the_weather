import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_value_failure.freezed.dart';

@freezed
class WeatherValueFailure<T> with _$WeatherValueFailure<T> {
  const factory WeatherValueFailure.weatherDataNotCorrect({
    required T failedValue,
  }) = WeatherDataNotCorrect<T>;
}
