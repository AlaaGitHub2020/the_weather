import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/astro/astro.dart';
import 'package:the_weather/domain/weather/day/day.dart';
import 'package:the_weather/domain/weather/forecastday/forecastday.dart';
import 'package:the_weather/domain/weather/forecastday/value_objects.dart';
import 'package:the_weather/domain/weather/hour/hour.dart';
import 'package:the_weather/infrastructure/weather/astro/astro_converter.dart';
import 'package:the_weather/infrastructure/weather/astro/astro_data_transfer_object.dart';
import 'package:the_weather/infrastructure/weather/day/day_converter.dart';
import 'package:the_weather/infrastructure/weather/day/day_data_transfer_object.dart';
import 'package:the_weather/infrastructure/weather/hour/hour_converter.dart';
import 'package:the_weather/infrastructure/weather/hour/hour_data_transfer_object.dart';
import 'package:the_weather/main.dart';

part 'forecastday_data_transfer_object.freezed.dart';

part 'forecastday_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class ForecastdayDto with _$ForecastdayDto {
  factory ForecastdayDto({
    String? date,
    int? date_epoch,
    @DayConverter() Day? day,
    @AstroConverter() Astro? astro,
    @HourConverter() List<Hour?>? hour,
  }) = _ForecastdayDto;

  factory ForecastdayDto.fromDomain(Forecastday? forecastday) {
    return ForecastdayDto(
      date: forecastday!.date!.getOrCrash(),
      date_epoch: forecastday.date_epoch!.getOrCrash(),
      day: forecastday.day,
      astro: forecastday.astro,
      hour: forecastday.hour,
    );
  }

  factory ForecastdayDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastdayDtoFromJson(json);
}

extension ForecastdayDtoX on ForecastdayDto {
  Forecastday? toDomain() {
    List<Hour?>? listOfHours = [];
    if (hour != null) {
      for (int x = 0; x < hour!.length; x++) {
        listOfHours.add(
          HourDto.fromDomain(hour![x]).toDomain(),
        );
      }
    }
    log.d(listOfHours);
    return Forecastday(
      date: Date(date),
      date_epoch: Date_epoch(date_epoch),
      day: DayDto.fromDomain(day).toDomain(),
      astro: AstroDto.fromDomain(astro).toDomain(),
      hour: listOfHours,
    );
  }
}
