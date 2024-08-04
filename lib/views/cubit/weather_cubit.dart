import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

   WeatherModel ?weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(
        WeatherLoadedState(weatherModel: weatherModel!),
      );
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
