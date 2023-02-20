import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/current_weather/value_objects.dart';

part 'current_weather.freezed.dart';

@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    Last_updated_epoch? last_updated_epoch,
    Last_updated? last_updated,
    Temp_c? temp_c,
    Temp_f? temp_f,
    Is_day? is_day,
    Condition? condition,
    Wind_mph? wind_mph,
    Wind_kph? wind_kph,
    Wind_degree? wind_degree,
    Wind_dir? wind_dir,
    Pressure_mb? pressure_mb,
    Pressure_in? pressure_in,
    Precip_mm? precip_mm,
    Precip_in? precip_in,
    Humidity? humidity,
    Cloud? cloud,
    Feelslike_c? feelslike_c,
    Feelslike_f? feelslike_f,
    Vis_km? vis_km,
    Vis_miles? vis_miles,
    Uv? uv,
    Gust_mph? gust_mph,
    Gust_kph? gust_kph,
  }) = _CurrentWeather;

  factory CurrentWeather.empty() => CurrentWeather(
        last_updated_epoch: Last_updated_epoch(0),
        last_updated: Last_updated(''),
        temp_c: Temp_c(0.0),
        temp_f: Temp_f(0.0),
        is_day: Is_day(0),
        condition: Condition.empty(),
        wind_mph: Wind_mph(0.0),
        wind_kph: Wind_kph(0.0),
        wind_degree: Wind_degree(0.0),
        wind_dir: Wind_dir(''),
        pressure_mb: Pressure_mb(0.0),
        pressure_in: Pressure_in(0.0),
        precip_mm: Precip_mm(0.0),
        precip_in: Precip_in(0.0),
        humidity: Humidity(0),
        cloud: Cloud(0),
        feelslike_c: Feelslike_c(0.0),
        feelslike_f: Feelslike_f(0.0),
        vis_km: Vis_km(0.0),
        vis_miles: Vis_miles(0.0),
        uv: Uv(0.0),
        gust_mph: Gust_mph(0.0),
        gust_kph: Gust_kph(0.0),
      );
}
