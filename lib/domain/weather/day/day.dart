import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/day/value_objects.dart';

part 'day.freezed.dart';

@freezed
class Day with _$Day {
  const factory Day({
    Maxtemp_c? maxtemp_c,
    Maxtemp_f? maxtemp_f,
    Mintemp_c? mintemp_c,
    Mintemp_f? mintemp_f,
    Avgtemp_c? avgtemp_c,
    Avgtemp_f? avgtemp_f,
    Maxwind_mph? maxwind_mph,
    Maxwind_kph? maxwind_kph,
    Totalprecip_mm? totalprecip_mm,
    Totalprecip_in? totalprecip_in,
    Totalsnow_cm? totalsnow_cm,
    Avgvis_km? avgvis_km,
    Avgvis_miles? avgvis_miles,
    Avghumidity? avghumidity,
    Daily_will_it_rain? daily_will_it_rain,
    Daily_chance_of_rain? daily_chance_of_rain,
    Daily_will_it_snow? daily_will_it_snow,
    Daily_chance_of_snow? daily_chance_of_snow,
    Condition? condition,
    Uv? uv,
  }) = _Day;

  factory Day.empty() => Day(
        maxtemp_c: Maxtemp_c(0.0),
        maxtemp_f: Maxtemp_f(0.0),
        mintemp_c: Mintemp_c(0.0),
        mintemp_f: Mintemp_f(0.0),
        avgtemp_c: Avgtemp_c(0.0),
        avgtemp_f: Avgtemp_f(0.0),
        maxwind_mph: Maxwind_mph(0.0),
        maxwind_kph: Maxwind_kph(0.0),
        totalprecip_mm: Totalprecip_mm(0.0),
        totalprecip_in: Totalprecip_in(0.0),
        totalsnow_cm: Totalsnow_cm(0.0),
        avgvis_km: Avgvis_km(0.0),
        avgvis_miles: Avgvis_miles(0.0),
        avghumidity: Avghumidity(0.0),
        daily_will_it_rain: Daily_will_it_rain(0),
        daily_chance_of_rain: Daily_chance_of_rain(0),
        daily_will_it_snow: Daily_will_it_snow(0),
        daily_chance_of_snow: Daily_chance_of_snow(0),
        condition: Condition.empty(),
        uv: Uv(0.0),
      );
}
