/* // ignore: file_names
import 'package:flutter/Material.dart';
import 'package:weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  Weather? _weather;

  set setWeather(Weather? weather) {
    _weather = weather;
    notifyListeners();
  }

  Weather? get weather => _weather;
  List cityList = [];
  List currentSearchList = [];

  void clearSearchList() {
    currentSearchList.clear();
    notifyListeners();
  }

  updateSearchList(String search) {
    currentSearchList = cityList
        .where(
            (element) => element.toLowerCase().contains(search.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
 */