import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/astro/astro.dart';
import 'package:the_weather/domain/weather/astro/value_objects.dart';

part 'astro_data_transfer_object.freezed.dart';

part 'astro_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class AstroDto with _$AstroDto {
  factory AstroDto({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moon_phase,
    String? moon_illumination,
    int? is_moon_up,
    int? is_sun_up,
  }) = _AstroDto;

  factory AstroDto.fromDomain(Astro? astro) {
    return AstroDto(
      sunrise: astro!.sunrise!.getOrCrash(),
      sunset: astro.sunset!.getOrCrash(),
      moonrise: astro.moonrise!.getOrCrash(),
      moonset: astro.moonset!.getOrCrash(),
      moon_phase: astro.moon_phase!.getOrCrash(),
      moon_illumination: astro.moon_illumination!.getOrCrash(),
      is_moon_up: astro.is_moon_up!.getOrCrash(),
      is_sun_up: astro.is_sun_up!.getOrCrash(),
    );
  }

  factory AstroDto.fromJson(Map<String, dynamic> json) =>
      _$AstroDtoFromJson(json);
}

extension AstroDtoX on AstroDto {
  Astro? toDomain() {
    return Astro(
      sunrise: Sunrise(sunrise),
      sunset: Sunset(sunset),
      moonrise: Moonrise(moonrise),
      moonset: Moonset(moonset),
      moon_phase: Moon_phase(moon_phase),
      moon_illumination: Moon_illumination(moon_illumination),
      is_moon_up: Is_moon_up(is_moon_up),
      is_sun_up: Is_sun_up(is_sun_up),
    );
  }
}
