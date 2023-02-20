import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:the_weather/domain/api/api_failure.dart';

abstract class IAPIRepository {
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options});
}
