part of 'current_weather_ui_bloc.dart';

@freezed
class CurrentWeatherUiState with _$CurrentWeatherUiState {
  const factory CurrentWeatherUiState.initial() = _Initial;

  const factory CurrentWeatherUiState.loading() = _Loading;

  const factory CurrentWeatherUiState.actionFailure(
      WeatherFailure weatherFailure) = _ActionFailure;

  const factory CurrentWeatherUiState.actionSuccess(Weather currentWeather) =
      _ActionSuccess;
}
