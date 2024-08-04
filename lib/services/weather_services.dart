import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c81189aca585445485b24807242807';
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10',
      );
      WeatherModel weatherModel = WeatherModel.formjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'ooops , try later';
      throw (errorMessage);
    } catch (e) {
      log(e.toString());
      throw ('ooops , try later');
    }
  }
}
