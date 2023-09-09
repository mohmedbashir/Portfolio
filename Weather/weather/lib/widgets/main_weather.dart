import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
// import 'package:google_fonts/google_fonts.dart';

import '../helper/status_image.dart';
import '../controller/Weather_provider.dart';

Widget mainWeather(Weather weather) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          statusImage(weather.status),
          height: 130,
        ),
        const SizedBox(height: 15),
        Text(
          '${(weather.temp - 273).toStringAsFixed(1)}°',
          style: TextStyle(
              color: Colors.black, fontSize: 50, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 10),
        Text(
          weather.status,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.w300, color: Colors.black),
        ),
      ],
    ),
  );
}
