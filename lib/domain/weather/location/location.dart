import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/location/value_objects.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    Name? name,
    Region? region,
    Country? country,
    Lat? lat,
    Lon? lon,
    Tz_id? tz_id,
    Localtime_epoch? localtime_epoch,
    Localtime? localtime,
  }) = _Location;

  factory Location.empty() => Location(
        name: Name(''),
        region: Region(''),
        lat: Lat(0.0),
        lon: Lon(0.0),
        tz_id: Tz_id(''),
        localtime_epoch: Localtime_epoch(0),
        localtime: Localtime(''),
      );
}
