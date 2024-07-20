import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import '../data/repository/weather_repository.dart';
import '../models/weather_model.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial()) {
    on<WeatherEvent>((event, emit) {
      emit(WeatherLoading());
    });

    on<WeatherFetch>(_onWeatherFetch);
  }

  void _onWeatherFetch(
    WeatherFetch event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      final weatherModel = await _weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
