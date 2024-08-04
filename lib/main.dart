import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/cubit/weather_cubit.dart';
import 'package:weather_app/views/cubit/weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// api key   c81189aca585445485b24807242807
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.blue,
              appBarTheme: AppBarTheme(
                backgroundColor: getThemeWeather(
                  BlocProvider.of<WeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
            ),
            title: 'Flutter Demo',
            home: const HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getThemeWeather(String? condition) {
    switch (condition) {
      case 'Sunny':
        return Colors.orange;
      case 'Clear':
        return Colors.yellow;
      case 'Partly cloudy':
        return Colors.cyan;
      case 'Cloudy':
        return Colors.grey;
      case 'Overcast':
        return Colors.grey;
      case 'Mist':
        return Colors.blueGrey;
      case 'Patchy rain possible':
        return Colors.lightBlue;
      case 'Patchy snow possible':
        return Colors.red;
      case 'Patchy sleet possible':
        return Colors.indigo;
      case 'Patchy freezing drizzle possible':
        return Colors.blue;
      case 'Thundery outbreaks possible':
        return Colors.deepOrange;
      case 'Blowing snow':
        return Colors.lightGreen;
      case 'Blizzard':
        return Colors.lightGreen;
      case 'Fog':
        return Colors.grey;
      case 'Freezing fog':
      case 'Patchy light drizzle':
        return Colors.deepPurple;
      case 'Light drizzle':
        return Colors.lightBlue;
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
        return Colors.blue;
      case 'Patchy light rain':
        return Colors.lightBlue;
      case 'Light rain':
        return Colors.lightBlue;
      case 'Moderate rain at times':
        return Colors.lightBlue;
      case 'Moderate rain':
      case 'Heavy rain at times':
        return Colors.blue;
      case 'Heavy rain':
        return Colors.blue;
      case 'Light freezing rain':
      case 'Moderate or heavy freezing rain':
        return Colors.blue;
      case 'Light sleet':
      case 'Moderate or heavy sleet':
        return Colors.blue;
      case 'Patchy light snow':
      case 'Light snow':
      case 'PatColor.fromARGB(255, 12, 10, 10) snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Ice pellets':
        return Colors.lightBlue;
      case 'Moderate or heavy rain shower':
        return Colors.blue;
      case 'Torrential rain shower':
        return Colors.blue;
      case 'Light sleet showers':
      case 'Moderate or heavy sleet showers':
        return Colors.blue;
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
      case 'Light showers of ice pellets':
      case 'Moderate or heavy showers of ice pellets':
        return Colors.blue;
      case 'Patchy light rain with thunder':
        return Colors.lightBlue;
      case 'Moderate or heavy rain with thunder':
        return Colors.blue;
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
      default:
        return Colors.blue;
    }
  }
