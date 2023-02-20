import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/condition/value_objects.dart';

part 'condition.freezed.dart';

@freezed
class Condition with _$Condition {
  const factory Condition({
    ConditionText? text,
    ConditionIcon? icon,
    ConditionCode? code,
  }) = _Condition;

  factory Condition.empty() =>
      Condition(
        text: ConditionText(''),
        icon: ConditionIcon(''),
        code: ConditionCode(0),
      );
}
