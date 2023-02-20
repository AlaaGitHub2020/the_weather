import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/forecast/forecast.dart';
import 'package:the_weather/domain/weather/forecastday/forecastday.dart';
import 'package:the_weather/infrastructure/weather/forecastday/forecastday_converter.dart';
import 'package:the_weather/infrastructure/weather/forecastday/forecastday_data_transfer_object.dart';
import 'package:the_weather/main.dart';

part 'forecast_data_transfer_object.freezed.dart';

part 'forecast_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class ForecastDto with _$ForecastDto {
  factory ForecastDto({
    @ForecastdayConverter() List<Forecastday?>? forecastday,
  }) = _ForecastDto;

  factory ForecastDto.fromDomain(Forecast? forecast) {
    return ForecastDto(
      forecastday: forecast!.forecastday,
    );
  }

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);
}

extension ForecastDtoX on ForecastDto {
  Forecast? toDomain() {
    List<Forecastday?>? listOfForecastdays = [];
    if (forecastday != null) {
      for (int x = 0; x < forecastday!.length; x++) {
        listOfForecastdays.add(
          ForecastdayDto.fromDomain(forecastday![x]).toDomain(),
        );
      }
    }
    log.d(listOfForecastdays);
    return Forecast(
      forecastday: listOfForecastdays,
    );
  }
}
