import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/condition/condition_value_validators.dart';

class ConditionText extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory ConditionText(String? input) {
    return ConditionText._(
      validateConditionText(input),
    );
  }

  const ConditionText._(this.value);
}

class ConditionIcon extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory ConditionIcon(String? input) {
    return ConditionIcon._(
      validateConditionIcon(input),
    );
  }

  const ConditionIcon._(this.value);
}

class ConditionCode extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory ConditionCode(int? input) {
    return ConditionCode._(
      validateConditionCode(input),
    );
  }

  const ConditionCode._(this.value);
}
