import 'dart:convert';

import 'package:belajar_bloc/weather_app/data/data_provider/weather_data_provider.dart';
import 'package:belajar_bloc/weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';

      final watherData = await weatherDataProvider.getCurrentWeather(cityName);

      final data = jsonDecode(watherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}