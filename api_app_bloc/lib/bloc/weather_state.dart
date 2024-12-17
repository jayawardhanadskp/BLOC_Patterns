part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSucess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSucess({required this.weatherModel});
}

final class WeatherFalure extends WeatherState {
  final String error;

  WeatherFalure(this.error);
}

final class WeatherLoading extends WeatherState {}
