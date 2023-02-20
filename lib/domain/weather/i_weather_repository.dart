import 'package:dartz/dartz.dart';
import 'package:the_weather/domain/weather/weather.dart';
import 'package:the_weather/domain/weather/weather_failure.dart';

abstract class IWeatherRepository {
  Future<Either<WeatherFailure, Weather>> fetchCurrentWeatherData(
      String city, String apiKey, String aqi);

  Future<Either<WeatherFailure, Weather>> fetchForecastWeatherData(
      String city, String apiKey, String aqi, String days, String alerts);
}
