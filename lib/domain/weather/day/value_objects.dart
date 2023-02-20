import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/core/failures.dart';
import 'package:the_weather/domain/core/value_objects.dart';
import 'package:the_weather/domain/weather/day/day_validators.dart';

class Maxtemp_c extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Maxtemp_c(double? input) {
    return Maxtemp_c._(
      validateMaxtemp_c(input),
    );
  }

  const Maxtemp_c._(this.value);
}

class Maxtemp_f extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Maxtemp_f(double? input) {
    return Maxtemp_f._(
      validateMaxtemp_f(input),
    );
  }

  const Maxtemp_f._(this.value);
}

class Mintemp_c extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Mintemp_c(double? input) {
    return Mintemp_c._(
      validateMintemp_c(input),
    );
  }

  const Mintemp_c._(this.value);
}

class Mintemp_f extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Mintemp_f(double? input) {
    return Mintemp_f._(
      validateMintemp_f(input),
    );
  }

  const Mintemp_f._(this.value);
}

class Avgtemp_c extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Avgtemp_c(double? input) {
    return Avgtemp_c._(
      validateAvgtemp_c(input),
    );
  }

  const Avgtemp_c._(this.value);
}

class Avgtemp_f extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Avgtemp_f(double? input) {
    return Avgtemp_f._(
      validateAvgtemp_f(input),
    );
  }

  const Avgtemp_f._(this.value);
}

class Maxwind_mph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Maxwind_mph(double? input) {
    return Maxwind_mph._(
      validateMaxwind_mph(input),
    );
  }

  const Maxwind_mph._(this.value);
}

class Maxwind_kph extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Maxwind_kph(double? input) {
    return Maxwind_kph._(
      validateMaxwind_kph(input),
    );
  }

  const Maxwind_kph._(this.value);
}

class Totalprecip_mm extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Totalprecip_mm(double? input) {
    return Totalprecip_mm._(
      validateTotalprecip_mm(input),
    );
  }

  const Totalprecip_mm._(this.value);
}

class Totalprecip_in extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Totalprecip_in(double? input) {
    return Totalprecip_in._(
      validateTotalprecip_in(input),
    );
  }

  const Totalprecip_in._(this.value);
}

class Totalsnow_cm extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Totalsnow_cm(double? input) {
    return Totalsnow_cm._(
      validateTotalsnow_cm(input),
    );
  }

  const Totalsnow_cm._(this.value);
}

class Avgvis_km extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Avgvis_km(double? input) {
    return Avgvis_km._(
      validateAvgvis_km(input),
    );
  }

  const Avgvis_km._(this.value);
}

class Avgvis_miles extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Avgvis_miles(double? input) {
    return Avgvis_miles._(
      validateAvgvis_miles(input),
    );
  }

  const Avgvis_miles._(this.value);
}

class Avghumidity extends ValueObject<double?> {
  @override
  final Either<Failure<double?>, double?> value;

  factory Avghumidity(double? input) {
    return Avghumidity._(
      validateAvghumidity(input),
    );
  }

  const Avghumidity._(this.value);
}

class Daily_will_it_rain extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Daily_will_it_rain(int? input) {
    return Daily_will_it_rain._(
      validateDaily_will_it_rain(input),
    );
  }

  const Daily_will_it_rain._(this.value);
}

class Daily_chance_of_rain extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Daily_chance_of_rain(int? input) {
    return Daily_chance_of_rain._(
      validateDaily_chance_of_rain(input),
    );
  }

  const Daily_chance_of_rain._(this.value);
}

class Daily_will_it_snow extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Daily_will_it_snow(int? input) {
    return Daily_will_it_snow._(
      validateDaily_will_it_snow(input),
    );
  }

  const Daily_will_it_snow._(this.value);
}

class Daily_chance_of_snow extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory Daily_chance_of_snow(int? input) {
    return Daily_chance_of_snow._(
      validateDaily_chance_of_snow(input),
    );
  }

  const Daily_chance_of_snow._(this.value);
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
