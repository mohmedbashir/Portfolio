import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';
import '../controller/Weather_provider.dart';
import 'widgets.dart';

Column attributesGrid(Weather weather) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          attributeBox(
              icon: Icons.wind_power_outlined,
              title: 'Wind',
              value: '${weather.windSpeed}',
              unit: ' km/h'),
          attributeBox(
              icon: Icons.wb_sunny_outlined,
              title: 'Feels like',
              value:
                  '${double.parse((weather.feelsLike - 273).toStringAsFixed(1))}°'),
        ],
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          attributeBox(
              icon: Icons.water_drop_outlined,
              title: 'Humadity',
              value: '${weather.humidity}',
              unit: ' g/m^3'),
          attributeBox(
              icon: Icons.arrow_downward_rounded,
              title: 'Pressure',
              value: '${weather.pressure}',
              unit: ' Pa'),
        ],
      ),
    ],
  );
}
