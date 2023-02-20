import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<double?>, double?> validateMaxtemp_c(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateMaxtemp_f(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateMintemp_c(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateMintemp_f(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateAvgtemp_c(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateAvgtemp_f(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateMaxwind_mph(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateMaxwind_kph(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateTotalprecip_mm(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateTotalprecip_in(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateTotalsnow_cm(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateAvgvis_km(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateAvgvis_miles(double? input) {
  return right(input);
}

Either<Failure<double?>, double?> validateAvghumidity(double? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateDaily_will_it_rain(int? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateDaily_chance_of_rain(int? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateDaily_will_it_snow(int? input) {
  return right(input);
}

Either<Failure<int?>, int?> validateDaily_chance_of_snow(int? input) {
  return right(input);
}
Either<Failure<double?>, double?> validateUv(double? input) {
  return right(input);
}
