import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/location/location.dart';
import 'package:the_weather/domain/weather/location/value_objects.dart';

part 'location_data_transfer_object.freezed.dart';

part 'location_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
class LocationDto with _$LocationDto {
  factory LocationDto({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tz_id,
    int? localtime_epoch,
    String? localtime,
  }) = _LocationDto;

  factory LocationDto.fromDomain(Location? location) {
    return LocationDto(
      name: location!.name!.getOrCrash(),
      region: location.region!.getOrCrash(),
      country: location.country!.getOrCrash(),
      lat: location.lat!.getOrCrash(),
      lon: location.lon!.getOrCrash(),
      tz_id: location.tz_id!.getOrCrash(),
      localtime_epoch: location.localtime_epoch!.getOrCrash(),
      localtime: location.localtime!.getOrCrash(),
    );
  }

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

extension LocationDtoX on LocationDto {
  Location? toDomain() {
    return Location(
      name: Name(name),
      region: Region(region),
      country: Country(country),
      lat: Lat(lat),
      lon: Lon(lon),
      tz_id: Tz_id(tz_id),
      localtime_epoch: Localtime_epoch(localtime_epoch),
      localtime: Localtime(localtime),
    );
  }
}
