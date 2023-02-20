import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/astro/astro.dart';
import 'package:the_weather/infrastructure/weather/astro/astro_data_transfer_object.dart';

class AstroConverter implements JsonConverter<Astro?, Map<String, dynamic>> {
  const AstroConverter();

  @override
  Astro? fromJson(Map<String, dynamic> json) {
    return AstroDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Astro? astro) => AstroDto().toJson();
}
