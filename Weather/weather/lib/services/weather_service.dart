import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  Future<Weather?> getCurrentWeather({String? city = 'gaza'}) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=db22a21fdc75a09ca7deb446fb048a08');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("object");
      Map<String, dynamic> weatherData = jsonDecode(response.body);
      return Weather.fromJson(weatherData);
    }
    return null;
  }
}
