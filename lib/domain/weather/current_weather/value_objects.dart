import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/current_weather/current_weather_validators.dart';

class Last_updated_epoch extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Last_updated_epoch(int? input) {
    return Last_updated_epoch._(
      validateLast_updated_epoch(input),
    );
  }

  const Last_updated_epoch._(this.value);
}

class Last_updated extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Last_updated(String? input) {
    return Last_updated._(
      validateLast_updated(input),
    );
  }

  const Last_updated._(this.value);
}

class Temp_c extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Temp_c(double? input) {
    return Temp_c._(
      validateTemp_c(input),
    );
  }

  const Temp_c._(this.value);
}

class Temp_f extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Temp_f(double? input) {
    return Temp_f._(
      validateTemp_f(input),
    );
  }

  const Temp_f._(this.value);
}

class Is_day extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Is_day(int? input) {
    return Is_day._(
      validateIs_day(input),
    );
  }

  const Is_day._(this.value);
}

class Wind_mph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Wind_mph(double? input) {
    return Wind_mph._(
      validateWind_mph(input),
    );
  }

  const Wind_mph._(this.value);
}

class Wind_kph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Wind_kph(double? input) {
    return Wind_kph._(
      validateWind_kph(input),
    );
  }

  const Wind_kph._(this.value);
}

class Wind_degree extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Wind_degree(double? input) {
    return Wind_degree._(
      validateWind_degree(input),
    );
  }

  const Wind_degree._(this.value);
}

class Wind_dir extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Wind_dir(String? input) {
    return Wind_dir._(
      validateWind_dir(input),
    );
  }

  const Wind_dir._(this.value);
}

class Pressure_mb extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Pressure_mb(double? input) {
    return Pressure_mb._(
      validatePressure_mb(input),
    );
  }

  const Pressure_mb._(this.value);
}

class Pressure_in extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Pressure_in(double? input) {
    return Pressure_in._(
      validatePressure_in(input),
    );
  }

  const Pressure_in._(this.value);
}

class Precip_mm extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Precip_mm(double? input) {
    return Precip_mm._(
      validatePrecip_mm(input),
    );
  }

  const Precip_mm._(this.value);
}

class Precip_in extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Precip_in(double? input) {
    return Precip_in._(
      validatePrecip_in(input),
    );
  }

  const Precip_in._(this.value);
}

class Humidity extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Humidity(int? input) {
    return Humidity._(
      validateHumidity(input),
    );
  }

  const Humidity._(this.value);
}

class Cloud extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Cloud(int? input) {
    return Cloud._(
      validateCloud(input),
    );
  }

  const Cloud._(this.value);
}

class Feelslike_c extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Feelslike_c(double? input) {
    return Feelslike_c._(
      validateFeelslike_c(input),
    );
  }

  const Feelslike_c._(this.value);
}

class Feelslike_f extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Feelslike_f(double? input) {
    return Feelslike_f._(
      validateFeelslike_f(input),
    );
  }

  const Feelslike_f._(this.value);
}

class Vis_km extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Vis_km(double? input) {
    return Vis_km._(
      validateVis_km(input),
    );
  }

  const Vis_km._(this.value);
}

class Vis_miles extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Vis_miles(double? input) {
    return Vis_miles._(
      validateVis_miles(input),
    );
  }

  const Vis_miles._(this.value);
}

class Uv extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Uv(double? input) {
    return Uv._(
      validateUv(input),
    );
  }

  const Uv._(this.value);
}

class Gust_mph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Gust_mph(double? input) {
    return Gust_mph._(
      validateGust_mph(input),
    );
  }

  const Gust_mph._(this.value);
}

class Gust_kph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Gust_kph(double? input) {
    return Gust_kph._(
      validateGust_kph(input),
    );
  }

  const Gust_kph._(this.value);
}
