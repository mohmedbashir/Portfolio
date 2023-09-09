import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/models/weather_model.dart';
import '../controller/Weather_provider.dart';

Column locationAndTime(Weather weather) {
  String currentTime = DateFormat.jm().format(DateTime.now()).toString();
  return Column(
    children: [
      RichText(
        text: TextSpan(
            text: weather.cityName,
            style: const TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
            children: [
              const TextSpan(text: ', '),
              TextSpan(
                text: weather.country,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w300),
              )
            ]),
      ),
      Text(
        'Today, $currentTime',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}
