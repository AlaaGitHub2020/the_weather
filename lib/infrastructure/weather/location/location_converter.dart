import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:the_weather/domain/weather/location/location.dart';
import 'package:the_weather/infrastructure/weather/location/location_data_transfer_object.dart';

class LocationConverter
    implements JsonConverter<Location?, Map<String, dynamic>> {
  const LocationConverter();

  @override
  Location? fromJson(Map<String, dynamic> json) {
    return LocationDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Location? location) => LocationDto().toJson();
}
