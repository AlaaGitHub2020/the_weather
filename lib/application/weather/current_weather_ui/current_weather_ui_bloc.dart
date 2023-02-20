import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:the_weather/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';
import 'package:the_weather/domain/weather/i_weather_repository.dart';
import 'package:the_weather/domain/weather/weather.dart';
import 'package:the_weather/domain/weather/weather_failure.dart';

part 'current_weather_ui_bloc.freezed.dart';

part 'current_weather_ui_event.dart';

part 'current_weather_ui_state.dart';

@injectable
class CurrentWeatherUiBloc
    extends Bloc<CurrentWeatherUiEvent, CurrentWeatherUiState> {
  final IWeatherRepository _weatherRepository;
  final log = getLogger();

  CurrentWeatherUiBloc(this._weatherRepository)
      : super(const CurrentWeatherUiState.initial()) {
    on<CurrentWeatherUiEvent>(
      (event, emit) async {
        await event.map(
          getCurrentWeatherData: (e) async {
            log.i("getCurrentWeatherData Started");
            emit(const CurrentWeatherUiState.loading());
            final failureOrSuccess = await _weatherRepository
                .fetchCurrentWeatherData(e.city, Strings.eAPIKey, Strings.cNo);
            CurrentWeatherUiState currentWeatherUiState =
                failureOrSuccess.fold((failure) {
              return CurrentWeatherUiState.actionFailure(failure);
            }, (success) {
              return CurrentWeatherUiState.actionSuccess(success);
            });
            emit(currentWeatherUiState);
          },
          getForeCastWeatherData: (e) async {
            log.i("getForeCastWeatherData Started");
            emit(const CurrentWeatherUiState.loading());
            final failureOrSuccess =
                await _weatherRepository.fetchForecastWeatherData(
                    e.city, Strings.eAPIKey, Strings.cNo, e.days, Strings.cNo);
            CurrentWeatherUiState forecastWeatherUiState =
                failureOrSuccess.fold((failure) {
              return CurrentWeatherUiState.actionFailure(failure);
            }, (success) {
              return CurrentWeatherUiState.actionSuccess(success);
            });
            emit(forecastWeatherUiState);
          },
          reset: (e) async {
            log.i("reset Started");
            emit(const CurrentWeatherUiState.initial());
          },
        );
      },
    );
  }
}
