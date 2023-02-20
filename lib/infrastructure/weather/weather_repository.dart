import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_weather/domain/api/api_failure.dart';
import 'package:the_weather/domain/api/i_api_repository.dart';
import 'package:the_weather/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';
import 'package:the_weather/domain/weather/i_weather_repository.dart';
import 'package:the_weather/domain/weather/weather.dart';
import 'package:the_weather/domain/weather/weather_failure.dart';
import 'package:the_weather/infrastructure/weather/weather_data_transfer_object.dart';

@LazySingleton(as: IWeatherRepository)
class WeatherRepository implements IWeatherRepository {
  final IAPIRepository _apiRepository;

  final log = getLogger();

  WeatherRepository(this._apiRepository);

  @override
  Future<Either<WeatherFailure, Weather>> fetchCurrentWeatherData(
      String city, String apiKey, String aqi) async {
    try {
      log.i("fetchTeamData Started");
      Either<APIFailure, Response<dynamic>> getDataResponse =
          await _apiRepository.getData(
              "current.json?key=${Strings.eAPIKey}&q=$city&aqi=${Strings.cNo}");
      late Weather? weather;
      getDataResponse.fold((failure) {
        log.e(failure);
      }, (response) {
        var decodedResponse = json.decode(response.data);
        weather = WeatherDto.fromJson(decodedResponse).toDomain();
        log.i("weather : $weather");
      });
      log.i("getDataResponse:$getDataResponse");
      if (weather == null) {
        return left(const WeatherFailure.fetchWeatherDataFailure());
      } else {
        return right(weather!);
      }
    } catch (e) {
      log.e(e);
      return left(const WeatherFailure.fetchWeatherDataFailure());
    }
  }

  @override
  Future<Either<WeatherFailure, Weather>> fetchForecastWeatherData(String city,
      String apiKey, String aqi, String days, String alerts) async {
    try {
      log.i("fetchForecastWeatherData Started");
      Either<
          APIFailure,
          Response<
              dynamic>> getDataResponse = await _apiRepository.getData(
          "forecast.json?key=${Strings.eAPIKey}&q=$city&days=$days&aqi=${Strings.cNo}&alerts=${Strings.cNo}");
      late Weather? weather;
      getDataResponse.fold((failure) {
        log.e(failure);
      }, (response) {
        var decodedResponse = json.decode(response.data);
        weather = WeatherDto.fromJson(decodedResponse).toDomain();
        log.i("weather : $weather");
      });
      log.i("getDataResponse:$getDataResponse");
      if (weather == null) {
        return left(const WeatherFailure.fetchWeatherDataFailure());
      } else {
        return right(weather!);
      }
    } catch (e) {
      log.e(e);
      return left(const WeatherFailure.fetchWeatherDataFailure());
    }
  }
}
