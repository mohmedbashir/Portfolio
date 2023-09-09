// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather/controller/Weather_provider.dart';
import 'package:weather/cubits/cubit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/widgets/widgets.dart';
import 'package:weather/constants/constants.dart';
import '../services/weather_service.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  Future<Weather> getGazaWeather() async {
    WeatherService service = WeatherService();
    Weather? gaza = await service.getCurrentWeather(city: 'gaza');
    return gaza!;
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: lightBlue,
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
                child: CircularProgressIndicator(
                    strokeWidth: 1, color: Colors.black));
          } else if (state is WeatherLoaded) {
            Weather loadedWeather =
                BlocProvider.of<WeatherCubit>(context).weather!;
            return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    lightBlue!,
                    lightBlue!,
                    lightBlue!,
                    darkBlue!,
                  ],
                )),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 25),
                      locationAndTime(loadedWeather),
                      const SizedBox(height: 25),
                      mainWeather(loadedWeather),
                      const Divider(thickness: 2, indent: 25, endIndent: 25),
                      attributesGrid(loadedWeather),
                      SizedBox(height: 50),
                    ],
                  ),
                ));
          } else if (state is WeatherFailure) {
            return const Center(child: Text("Something went wrong"));
          } else {
            return const Center(
                child: Text("Start searching now from the button below."));
          }
        },
      ),
      floatingActionButton: searchFloatinButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
