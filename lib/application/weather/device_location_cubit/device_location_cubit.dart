import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceLocationCubit extends Cubit<String> {
  DeviceLocationCubit() : super('');

  void updateDeviceLocation({required String deviceLocation}) async {
    emit(deviceLocation);
  }

  String getDeviceLocation() {
    return state;
  }
}
