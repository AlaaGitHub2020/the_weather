import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/forecast/forecast.dart';
import 'package:the_weather/infrastructure/weather/forecast/forecast_data_transfer_object.dart';

class ForecastConverter
    implements JsonConverter<Forecast?, Map<String, dynamic>> {
  const ForecastConverter();

  @override
  Forecast? fromJson(Map<String, dynamic> json) {
    return ForecastDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Forecast? forecast) => ForecastDto().toJson();
}
