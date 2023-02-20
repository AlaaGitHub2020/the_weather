import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/astro/astro.dart';
import 'package:the_weather/domain/weather/day/day.dart';
import 'package:the_weather/domain/weather/forecastday/value_objects.dart';
import 'package:the_weather/domain/weather/hour/hour.dart';

part 'forecastday.freezed.dart';

@freezed
class Forecastday with _$Forecastday {
  const factory Forecastday({
    Date? date,
    Date_epoch? date_epoch,
    Day? day,
    Astro? astro,
    List<Hour?>? hour,
  }) = _Forecastday;

  factory Forecastday.empty() => Forecastday(
        date: Date(''),
        date_epoch: Date_epoch(0),
        day: Day.empty(),
        astro: Astro.empty(),
        hour: [],
      );
}
