part of 'current_weather_ui_bloc.dart';

@freezed
class CurrentWeatherUiEvent with _$CurrentWeatherUiEvent {
  const factory CurrentWeatherUiEvent.getCurrentWeatherData(String city) =
      _GetCurrentWeatherData;

  const factory CurrentWeatherUiEvent.getForeCastWeatherData(
      String city, String days) = _GetForeCastWeatherData;

  const factory CurrentWeatherUiEvent.reset() = _Reset;
}
