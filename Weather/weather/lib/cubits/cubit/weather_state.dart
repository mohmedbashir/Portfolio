part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {}

class WeatherFailure extends WeatherState {}

class CitiesListUpdated extends WeatherState {}
