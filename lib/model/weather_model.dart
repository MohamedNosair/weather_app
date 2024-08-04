class WeatherModel {
  final String cityName;
  final String? image;
  final String date;
  final double maxTemp;
  final double minTemp;
  final double temp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      this.image,
      required this.date,
      required this.maxTemp,
      required this.minTemp,
      required this.temp,
      required this.weatherCondition});

  factory WeatherModel.formjson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: json['current']['last_updated'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
