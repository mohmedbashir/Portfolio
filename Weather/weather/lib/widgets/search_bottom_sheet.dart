import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/cubit/weather_cubit.dart';
import '../controller/Weather_provider.dart';
import 'package:weather/models/weather_model.dart';
import '../services/weather_service.dart';

searchBottmSheet(BuildContext context) async {
  WeatherService service = WeatherService();
  // Weather? weather;
  String? cityName;
  TextEditingController controller = TextEditingController();

  void startSearching(String? cityName) async {
    BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
    // weather = await service.getCurrentWeather(city: cityName);
    // searchProvider.setWeather = weather;
    BlocProvider.of<WeatherCubit>(context).clearSearchList();
    Navigator.pop(context);
  }

  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black.withOpacity(.8),
      context: context,
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        return SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextField(
                  controller: controller,
                  onChanged: (value) {
                    cityName = value;
                    BlocProvider.of<WeatherCubit>(context)
                        .updateSearchList(cityName!);
                    print('object');
                  },
                  onSubmitted: (value) async {
                    startSearching(value);
                  },
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(.3),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.search),
                        onPressed: (() async {
                          startSearching(cityName);
                        }),
                      )),
                ),
                SizedBox(
                  height: height - (height * .192),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlocBuilder<WeatherCubit, WeatherState>(
                          builder: (context, state) {
                        if (state is CitiesListUpdated) {
                          if (BlocProvider.of<WeatherCubit>(context)
                              .currentSearchList
                              .isNotEmpty) {
                            return InkWell(
                              onTap: () {
                                startSearching(
                                    BlocProvider.of<WeatherCubit>(context)
                                        .currentSearchList[index]);
                              },
                              splashColor: Colors.white.withOpacity(.1),
                              child: Row(children: [
                                const SizedBox(width: 12),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    BlocProvider.of<WeatherCubit>(context)
                                        .currentSearchList[index],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]),
                            );
                          } else {
                            return Center(
                                child: Text("No results , try seach again"));
                          }
                        } else {
                          return Center(child: Text("Start Searchings"));
                        }
                      });
                    },
                    itemCount: BlocProvider.of<WeatherCubit>(context)
                        .currentSearchList
                        .length,
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
