import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/astro/value_objects.dart';

part 'astro.freezed.dart';

@freezed
class Astro with _$Astro {
  const factory Astro({
    Sunrise? sunrise,
    Sunset? sunset,
    Moonrise? moonrise,
    Moonset? moonset,
    Moon_phase? moon_phase,
    Moon_illumination? moon_illumination,
    Is_moon_up? is_moon_up,
    Is_sun_up? is_sun_up,
  }) = _Astro;

  factory Astro.empty() => Astro(
        sunrise: Sunrise(''),
        sunset: Sunset(''),
        moonrise: Moonrise(''),
        moonset: Moonset(''),
        moon_phase: Moon_phase(''),
        moon_illumination: Moon_illumination(''),
        is_moon_up: Is_moon_up(0),
        is_sun_up: Is_sun_up(0),
      );
}
