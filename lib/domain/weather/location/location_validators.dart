import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<String?>, String?> validateName(String? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateRegion(String? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateCountry(String? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateLat(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateLon(double? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateTz_id(String? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateLocaltime_epoch(int? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateLocaltime(String? input) {
  return right(input);
}
