import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';

Either<Failure<String?>, String?> validateSunrise(String? input) {
  return right(input);
}
Either<Failure<String?>, String?> validateSunset(String? input) {
  return right(input);
}
Either<Failure<String?>, String?> validateMoonrise(String? input) {
  return right(input);
}
Either<Failure<String?>, String?> validateMoonset(String? input) {
  return right(input);
}
Either<Failure<String?>, String?> validateMoon_phase(String? input) {
  return right(input);
}
Either<Failure<String?>, String?> validateMoon_illumination(String? input) {
  return right(input);
}
Either<Failure<int?>, int?> validateIs_moon_up(int? input) {
  return right(input);
}
Either<Failure<int?>, int?> validateIs_sun_up(int? input) {
  return right(input);
}