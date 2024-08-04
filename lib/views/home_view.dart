import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/views/cubit/weather_cubit.dart';
import 'package:weather_app/views/cubit/weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        title: const Text(
          'Weather App',
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
            );
          } else {
            return const Text('oops there was an error');
          }
        },
      ),
    );
  }
}
