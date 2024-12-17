import 'package:api_app_bloc/data/repository/weather_repository.dart';
import 'package:api_app_bloc/models/weather_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFethched>(_getCurrentWeather);
  }

  void _getCurrentWeather(
      WeatherFethched state, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      print(weather);

      emit(WeatherSucess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFalure(e.toString()));
    }
  }
}
