import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/location/location_validators.dart';

class Name extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Name(String? input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
}

class Region extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Region(String? input) {
    return Region._(
      validateRegion(input),
    );
  }

  const Region._(this.value);
}

class Country extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Country(String? input) {
    return Country._(
      validateCountry(input),
    );
  }

  const Country._(this.value);
}

class Lat extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Lat(double? input) {
    return Lat._(
      validateLat(input),
    );
  }

  const Lat._(this.value);
}

class Lon extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Lon(double? input) {
    return Lon._(
      validateLon(input),
    );
  }

  const Lon._(this.value);
}

class Tz_id extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Tz_id(String? input) {
    return Tz_id._(
      validateTz_id(input),
    );
  }

  const Tz_id._(this.value);
}

class Localtime_epoch extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Localtime_epoch(int? input) {
    return Localtime_epoch._(
      validateLocaltime_epoch(input),
    );
  }

  const Localtime_epoch._(this.value);
}

class Localtime extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Localtime(String? input) {
    return Localtime._(
      validateLocaltime(input),
    );
  }

  const Localtime._(this.value);
}
