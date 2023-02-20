import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/hour/hour.dart';
import 'package:the_weather/infrastructure/weather/hour/hour_data_transfer_object.dart';

class HourConverter implements JsonConverter<Hour?, Map<String, dynamic>> {
  const HourConverter();

  @override
  Hour? fromJson(Map<String, dynamic> json) {
    return HourDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Hour? hour) => HourDto().toJson();
}
