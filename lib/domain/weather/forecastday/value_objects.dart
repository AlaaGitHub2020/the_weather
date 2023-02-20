import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/forecastday/date_validators.dart';

class Date extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Date(String? input) {
    return Date._(
      validateDate(input),
    );
  }

  const Date._(this.value);
}
class Date_epoch extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Date_epoch(int? input) {
    return Date_epoch._(
      validateDate_epoch(input),
    );
  }

  const Date_epoch._(this.value);
}
