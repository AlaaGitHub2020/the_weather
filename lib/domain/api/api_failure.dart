import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_failure.freezed.dart';

@freezed
class APIFailure with _$APIFailure {
  const factory APIFailure.unexpected() = _Unexpected;

  const factory APIFailure.failedToFetchData() = _FailedToFetchData;

  const factory APIFailure.failedToPushData() = _FailedToPushData;

  const factory APIFailure.failedToUpdateData() = _FailedToUpdateData;

  const factory APIFailure.failedToDeleteData() = _FailedToDeleteData;
}
