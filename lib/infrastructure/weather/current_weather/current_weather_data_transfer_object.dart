import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/current_weather/current_weather.dart';
import 'package:the_weather/domain/weather/current_weather/value_objects.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_converter.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_data_transfer_object.dart';

part 'current_weather_data_transfer_object.freezed.dart';

part 'current_weather_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class CurrentWeatherDto with _$CurrentWeatherDto {
  factory CurrentWeatherDto({
    int? last_updated_epoch,
    String? last_updated,
    double? temp_c,
    double? temp_f,
    int? is_day,
    @ConditionConverter() Condition? condition,
    double? wind_mph,
    double? wind_kph,
    double? wind_degree,
    String? wind_dir,
    double? pressure_mb,
    double? pressure_in,
    double? precip_mm,
    double? precip_in,
    int? humidity,
    int? cloud,
    double? feelslike_c,
    double? feelslike_f,
    double? vis_km,
    double? vis_miles,
    double? uv,
    double? gust_mph,
    double? gust_kph,
  }) = _CurrentWeatherDto;

  factory CurrentWeatherDto.fromDomain(CurrentWeather? currentWeather) {
    return CurrentWeatherDto(
      last_updated_epoch: currentWeather!.last_updated_epoch!.getOrCrash(),
      last_updated: currentWeather.last_updated!.getOrCrash(),
      temp_c: currentWeather.temp_c!.getOrCrash(),
      temp_f: currentWeather.temp_f!.getOrCrash(),
      is_day: currentWeather.is_day!.getOrCrash(),
      condition: currentWeather.condition,
      wind_mph: currentWeather.wind_mph!.getOrCrash(),
      wind_kph: currentWeather.wind_kph!.getOrCrash(),
      wind_degree: currentWeather.wind_degree!.getOrCrash(),
      wind_dir: currentWeather.wind_dir!.getOrCrash(),
      pressure_mb: currentWeather.pressure_mb!.getOrCrash(),
      pressure_in: currentWeather.pressure_in!.getOrCrash(),
      precip_mm: currentWeather.precip_mm!.getOrCrash(),
      precip_in: currentWeather.precip_in!.getOrCrash(),
      humidity: currentWeather.humidity!.getOrCrash(),
      cloud: currentWeather.cloud!.getOrCrash(),
      feelslike_c: currentWeather.feelslike_c!.getOrCrash(),
      feelslike_f: currentWeather.feelslike_f!.getOrCrash(),
      vis_km: currentWeather.vis_km!.getOrCrash(),
      vis_miles: currentWeather.vis_miles!.getOrCrash(),
      uv: currentWeather.uv!.getOrCrash(),
      gust_mph: currentWeather.gust_mph!.getOrCrash(),
      gust_kph: currentWeather.gust_kph!.getOrCrash(),
    );
  }

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);
}

extension CurrentWeatherDtoX on CurrentWeatherDto {
  CurrentWeather? toDomain() {
    return CurrentWeather(
      last_updated_epoch: Last_updated_epoch(last_updated_epoch),
      last_updated: Last_updated(last_updated),
      temp_c: Temp_c(temp_c),
      temp_f: Temp_f(temp_f),
      is_day: Is_day(is_day),
      condition: ConditionDto.fromDomain(condition).toDomain(),
      wind_mph: Wind_mph(wind_mph),
      wind_kph: Wind_kph(wind_kph),
      wind_degree: Wind_degree(wind_degree),
      wind_dir: Wind_dir(wind_dir),
      pressure_mb: Pressure_mb(pressure_mb),
      pressure_in: Pressure_in(pressure_in),
      precip_mm: Precip_mm(precip_mm),
      precip_in: Precip_in(precip_in),
      humidity: Humidity(humidity),
      cloud: Cloud(cloud),
      feelslike_c: Feelslike_c(feelslike_c),
      feelslike_f: Feelslike_f(feelslike_f),
      vis_km: Vis_km(vis_km),
      vis_miles: Vis_miles(vis_miles),
      uv: Uv(uv),
      gust_mph: Gust_mph(gust_mph),
      gust_kph: Gust_kph(gust_kph),
    );
  }
}
