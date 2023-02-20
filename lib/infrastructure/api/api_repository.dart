import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:the_weather/domain/api/api_failure.dart';
import 'package:the_weather/domain/api/i_api_repository.dart';
import 'package:the_weather/domain/api/interceptors/logging_interceptor.dart';
import 'package:the_weather/domain/core/utilities/config.dart';
import 'package:the_weather/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';

@LazySingleton(as: IAPIRepository)
class APIRepository implements IAPIRepository {
  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Config().get(
        kReleaseMode ? Strings.cReleaseApiBaseUrl : Strings.cDebugApiBaseUrl),
    contentType: ContentType.json.toString(),
    responseType: ResponseType.plain,
    connectTimeout: 10000,
    receiveTimeout: 30000,
  );

  late Dio _dio;
  final log = getLogger();

  APIRepository() {
    _dio = Dio(_baseOptions);
    _dio.interceptors.add(LoggingInterceptor());
  }

  @override
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options}) async {
    try {
      Response getDataResponse = await _dio.get(endpoint, options: options);
      return right(getDataResponse);
    } catch (e) {
      log.e(e);
      return left(const APIFailure.failedToFetchData());
    }
  }
}
