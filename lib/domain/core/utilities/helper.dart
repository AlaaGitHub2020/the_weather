import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather/application/weather/device_location_cubit/device_location_cubit.dart';

import '../../../main.dart';

abstract class Helper {
  static getLocation(Position position, BuildContext context) async {
    try {
      log.i("getLocation Started");

      await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).then((placeMarks) {
        log.i("deviceLocation ${placeMarks[0].locality.toString()}");
        context.read<DeviceLocationCubit>().updateDeviceLocation(
            deviceLocation: placeMarks[0].locality.toString());
      });
    } catch (err) {
      log.e("err $err");
    }
  }
}
