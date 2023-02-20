import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<String?>, String?> validateDate(String? input) {
  return right(input);
}
Either<Failure<int?>, int?> validateDate_epoch(int? input) {
  return right(input);
}
