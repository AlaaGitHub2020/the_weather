import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/day/day.dart';
import 'package:the_weather/infrastructure/weather/day/day_data_transfer_object.dart';

class DayConverter implements JsonConverter<Day?, Map<String, dynamic>> {
  const DayConverter();

  @override
  Day? fromJson(Map<String, dynamic> json) {
    return DayDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Day? day) => DayDto().toJson();
}
