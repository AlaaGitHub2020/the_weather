import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<int?>, int?> validateLast_updated_epoch(int? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateLast_updated(String? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateTemp_c(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateTemp_f(double? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateIs_day(int? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateWind_mph(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateWind_kph(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateWind_degree(double? input) {
  return right(input);
}

Either<Failure<String?>, String?> validateWind_dir(String? input) {
  return right(input);
}
Either<Failure<double?>, double?> validatePressure_mb(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validatePressure_in(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validatePrecip_mm(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validatePrecip_in(double? input) {
  return right(input);
}
Either<Failure<int?>, int?> validateHumidity(int? input) {
  return right(input);
}
Either<Failure<int?>, int?> validateCloud(int? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateFeelslike_c(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateFeelslike_f(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateVis_km(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateVis_miles(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateUv(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateGust_mph(double? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateGust_kph(double? input) {
  return right(input);
}
