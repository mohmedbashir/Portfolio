class Weather {
  String cityName;
  String country;
  String status;
  double temp;
  num feelsLike;
  num windSpeed;
  int pressure;
  int humidity;

  Weather(
      {required this.cityName,
      required this.country,
      required this.status,
      required this.temp,
      required this.feelsLike,
      required this.windSpeed,
      required this.pressure,
      required this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        country: json['sys']['country'],
        status: json['weather'][0]['main'],
        temp: json['main']['temp'],
        feelsLike: json['main']['feels_like'],
        windSpeed: json['wind']['speed'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity']);
  }
}
