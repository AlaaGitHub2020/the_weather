import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/day/day.dart';
import 'package:the_weather/domain/weather/day/value_objects.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_converter.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_data_transfer_object.dart';

part 'day_data_transfer_object.freezed.dart';

part 'day_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class DayDto with _$DayDto {
  factory DayDto({
    double? maxtemp_c,
    double? maxtemp_f,
    double? mintemp_c,
    double? mintemp_f,
    double? avgtemp_c,
    double? avgtemp_f,
    double? maxwind_mph,
    double? maxwind_kph,
    double? totalprecip_mm,
    double? totalprecip_in,
    double? totalsnow_cm,
    double? avgvis_km,
    double? avgvis_miles,
    double? avghumidity,
    int? daily_will_it_rain,
    int? daily_chance_of_rain,
    int? daily_will_it_snow,
    int? daily_chance_of_snow,
    @ConditionConverter() Condition? condition,
    double? uv,
  }) = _DayDto;

  factory DayDto.fromDomain(Day? day) {
    return DayDto(
      maxtemp_c: day!.maxtemp_c!.getOrCrash(),
      maxtemp_f: day.maxtemp_f!.getOrCrash(),
      mintemp_c: day.mintemp_c!.getOrCrash(),
      mintemp_f: day.mintemp_f!.getOrCrash(),
      avgtemp_c: day.avgtemp_c!.getOrCrash(),
      avgtemp_f: day.avgtemp_f!.getOrCrash(),
      maxwind_mph: day.maxwind_mph!.getOrCrash(),
      maxwind_kph: day.maxwind_kph!.getOrCrash(),
      totalprecip_mm: day.totalprecip_mm!.getOrCrash(),
      totalprecip_in: day.totalprecip_in!.getOrCrash(),
      totalsnow_cm: day.totalsnow_cm!.getOrCrash(),
      avgvis_km: day.avgvis_km!.getOrCrash(),
      avgvis_miles: day.avgvis_miles!.getOrCrash(),
      avghumidity: day.avghumidity!.getOrCrash(),
      daily_will_it_rain: day.daily_will_it_rain!.getOrCrash(),
      daily_chance_of_rain: day.daily_chance_of_rain!.getOrCrash(),
      daily_will_it_snow: day.daily_will_it_snow!.getOrCrash(),
      daily_chance_of_snow: day.daily_chance_of_snow!.getOrCrash(),
      condition: day.condition,
      uv: day.uv!.getOrCrash(),
    );
  }

  factory DayDto.fromJson(Map<String, dynamic> json) => _$DayDtoFromJson(json);
}

extension DayDtoX on DayDto {
  Day? toDomain() {
    return Day(
      maxtemp_c: Maxtemp_c(maxtemp_c),
      maxtemp_f: Maxtemp_f(maxtemp_f),
      mintemp_c: Mintemp_c(mintemp_c),
      mintemp_f: Mintemp_f(mintemp_f),
      avgtemp_c: Avgtemp_c(avgtemp_c),
      avgtemp_f: Avgtemp_f(avgtemp_f),
      maxwind_mph: Maxwind_mph(maxwind_mph),
      maxwind_kph: Maxwind_kph(maxwind_kph),
      totalprecip_mm: Totalprecip_mm(totalprecip_mm),
      totalprecip_in: Totalprecip_in(totalprecip_in),
      totalsnow_cm: Totalsnow_cm(totalsnow_cm),
      avgvis_km: Avgvis_km(avgvis_km),
      avgvis_miles: Avgvis_miles(avgvis_miles),
      avghumidity: Avghumidity(avghumidity),
      daily_will_it_rain: Daily_will_it_rain(daily_will_it_rain),
      daily_chance_of_rain: Daily_chance_of_rain(daily_chance_of_rain),
      daily_will_it_snow: Daily_will_it_snow(daily_will_it_snow),
      daily_chance_of_snow: Daily_chance_of_snow(daily_chance_of_snow),
      condition: ConditionDto.fromDomain(condition).toDomain(),
      uv: Uv(uv),
    );
  }
}
