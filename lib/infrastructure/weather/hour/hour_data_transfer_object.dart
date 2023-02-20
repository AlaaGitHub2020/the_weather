import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/hour/hour.dart';
import 'package:the_weather/domain/weather/hour/value_objects.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_converter.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_data_transfer_object.dart';

part 'hour_data_transfer_object.freezed.dart';

part 'hour_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class HourDto with _$HourDto {
  factory HourDto({
    int? time_epoch,
    String? time,
    double? temp_c,
    double? temp_f,
    int? is_day,
    @ConditionConverter() Condition? condition,
    double? wind_mph,
    double? wind_kph,
    int? wind_degree,
    String? wind_dir,
    double? pressure_mb,
    double? pressure_in,
    double? precip_mm,
    double? precip_in,
    int? humidity,
    int? cloud,
    double? feelslike_c,
    double? feelslike_f,
    double? windchill_c,
    double? windchill_f,
    double? heatindex_c,
    double? heatindex_f,
    double? dewpoint_c,
    double? dewpoint_f,
    int? will_it_rain,
    int? chance_of_rain,
    int? will_it_snow,
    int? chance_of_snow,
    double? vis_km,
    double? vis_miles,
    double? gust_mph,
    double? gust_kph,
    double? uv,
  }) = _HourDto;

  factory HourDto.fromDomain(Hour? hour) {
    return HourDto(
      time_epoch: hour!.time_epoch!.getOrCrash(),
      time: hour.time!.getOrCrash(),
      temp_c: hour.temp_c!.getOrCrash(),
      temp_f: hour.temp_f!.getOrCrash(),
      is_day: hour.is_day!.getOrCrash(),
      condition: hour.condition,
      wind_mph: hour.wind_mph!.getOrCrash(),
      wind_kph: hour.wind_kph!.getOrCrash(),
      wind_degree: hour.wind_degree!.getOrCrash(),
      wind_dir: hour.wind_dir!.getOrCrash(),
      pressure_mb: hour.pressure_mb!.getOrCrash(),
      pressure_in: hour.pressure_in!.getOrCrash(),
      precip_mm: hour.precip_mm!.getOrCrash(),
      precip_in: hour.precip_in!.getOrCrash(),
      humidity: hour.humidity!.getOrCrash(),
      cloud: hour.cloud!.getOrCrash(),
      feelslike_c: hour.feelslike_c!.getOrCrash(),
      feelslike_f: hour.feelslike_f!.getOrCrash(),
      windchill_c: hour.windchill_c!.getOrCrash(),
      windchill_f: hour.windchill_f!.getOrCrash(),
      heatindex_c: hour.heatindex_c!.getOrCrash(),
      heatindex_f: hour.heatindex_f!.getOrCrash(),
      dewpoint_c: hour.dewpoint_c!.getOrCrash(),
      dewpoint_f: hour.dewpoint_f!.getOrCrash(),
      will_it_rain: hour.will_it_rain!.getOrCrash(),
      chance_of_rain: hour.chance_of_rain!.getOrCrash(),
      will_it_snow: hour.will_it_snow!.getOrCrash(),
      chance_of_snow: hour.chance_of_snow!.getOrCrash(),
      vis_km: hour.vis_km!.getOrCrash(),
      vis_miles: hour.vis_miles!.getOrCrash(),
      gust_mph: hour.gust_mph!.getOrCrash(),
      gust_kph: hour.gust_kph!.getOrCrash(),
      uv: hour.uv!.getOrCrash(),
    );
  }

  factory HourDto.fromJson(Map<String, dynamic> json) =>
      _$HourDtoFromJson(json);
}

extension HourDtoX on HourDto {
  Hour? toDomain() {
    return Hour(
      time_epoch: Time_epoch(time_epoch),
      time: Time(time),
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
      windchill_c: Windchill_c(windchill_c),
      windchill_f: Windchill_f(windchill_f),
      heatindex_c: Heatindex_c(heatindex_c),
      heatindex_f: Heatindex_f(heatindex_f),
      dewpoint_c: Dewpoint_c(dewpoint_c),
      dewpoint_f: Dewpoint_f(dewpoint_f),
      will_it_rain: Will_it_rain(will_it_rain),
      chance_of_rain: Chance_of_rain(chance_of_rain),
      will_it_snow: Will_it_snow(will_it_snow),
      chance_of_snow: Chance_of_snow(chance_of_snow),
      vis_km: Vis_km(vis_km),
      vis_miles: Vis_miles(vis_miles),
      gust_mph: Gust_mph(gust_mph),
      gust_kph: Gust_kph(gust_kph),
      uv: Uv(uv),
    );
  }
}
