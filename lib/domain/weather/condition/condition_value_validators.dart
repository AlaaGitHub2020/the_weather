import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<String?>, String?> validateConditionText(String? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateConditionIcon(String? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateConditionCode(int? input) {
  return right(input);
}