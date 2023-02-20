part of 'api_manager_bloc.dart';

@freezed
class ApiManagerEvent with _$ApiManagerEvent {
  const factory ApiManagerEvent.getData(String endPoint) = _GetData;
}
