import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/astro/astro_validators.dart';

class Sunrise extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Sunrise(String? input) {
    return Sunrise._(
      validateSunrise(input),
    );
  }

  const Sunrise._(this.value);
}
class Sunset extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Sunset(String? input) {
    return Sunset._(
      validateSunset(input),
    );
  }

  const Sunset._(this.value);
}
class Moonrise extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Moonrise(String? input) {
    return Moonrise._(
      validateMoonrise(input),
    );
  }

  const Moonrise._(this.value);
}
class Moonset extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Moonset(String? input) {
    return Moonset._(
      validateMoonset(input),
    );
  }

  const Moonset._(this.value);
}
class Moon_phase extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Moon_phase(String? input) {
    return Moon_phase._(
      validateMoon_phase(input),
    );
  }

  const Moon_phase._(this.value);
}
class Moon_illumination extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Moon_illumination(String? input) {
    return Moon_illumination._(
      validateMoon_illumination(input),
    );
  }

  const Moon_illumination._(this.value);
}
class Is_moon_up extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Is_moon_up(int? input) {
    return Is_moon_up._(
      validateIs_moon_up(input),
    );
  }

  const Is_moon_up._(this.value);
}
class Is_sun_up extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Is_sun_up(int? input) {
    return Is_sun_up._(
      validateIs_sun_up(input),
    );
  }

  const Is_sun_up._(this.value);
}
