import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/forecastday/forecastday.dart';
import 'package:the_weather/infrastructure/weather/forecastday/forecastday_data_transfer_object.dart';

class ForecastdayConverter
    implements JsonConverter<Forecastday?, Map<String, dynamic>> {
  const ForecastdayConverter();

  @override
  Forecastday? fromJson(Map<String, dynamic> json) {
    return ForecastdayDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Forecastday? forecastday) =>
      ForecastdayDto().toJson();
}
