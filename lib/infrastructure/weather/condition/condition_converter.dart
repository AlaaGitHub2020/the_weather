import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/infrastructure/weather/condition/condition_data_transfer_object.dart';

class ConditionConverter
    implements JsonConverter<Condition?, Map<String, dynamic>> {
  const ConditionConverter();

  @override
  Condition? fromJson(Map<String, dynamic> json) {
    return ConditionDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Condition? condition) => ConditionDto().toJson();
}
