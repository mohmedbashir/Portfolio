import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  final WeatherService weatherService;
  Weather? weather;

  set setWeather(Weather? weather) {
    weather = weather;
  }

  List cityList = [];
  List currentSearchList = [];

  void clearSearchList() {
    currentSearchList.clear();
  }

  updateSearchList(String search) {
    currentSearchList = cityList
        .where(
            (element) => element.toLowerCase().contains(search.toLowerCase()))
        .toList();
    emit(CitiesListUpdated());
  }

  init() async {
    emit(WeatherLoading());
    weather = await weatherService.getCurrentWeather(city: "gaza");
    emit(WeatherLoaded());
    final String response =
        await rootBundle.loadString('assets/json/city.json');
    List<dynamic> data = await jsonDecode(response);

    for (int i = 0; i < data.length; i++) {
      cityList.add(data[i]['name'].toString());
    }
  }

  getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weather = await weatherService.getCurrentWeather(city: cityName);
      emit(WeatherLoaded());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
