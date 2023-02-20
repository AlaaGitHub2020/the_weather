import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/condition.dart';
import 'package:the_weather/domain/weather/condition/value_objects.dart';

part 'condition_data_transfer_object.freezed.dart';

part 'condition_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class ConditionDto with _$ConditionDto {
  factory ConditionDto({
    String? text,
    String? icon,
    int? code,
  }) = _ConditionDto;

  factory ConditionDto.fromDomain(Condition? condition) {
    return ConditionDto(
      text: condition!.text!.getOrCrash(),
      icon: condition.icon!.getOrCrash(),
      code: condition.code!.getOrCrash(),
    );
  }

  factory ConditionDto.fromJson(Map<String, dynamic> json) =>
      _$ConditionDtoFromJson(json);
}

extension ConditionDtoX on ConditionDto {
  Condition? toDomain() {
    return Condition(
      text: ConditionText(text),
      icon: ConditionIcon(icon),
      code: ConditionCode(code),
    );
  }
}
