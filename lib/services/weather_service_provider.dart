import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather/models/weathermodel.dart';
import 'package:weather/secrets/api.dart';
import 'package:http/http.dart' as http;

class WeatherServiceProvider extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = "";
  String get error => _error;

  Future<void> fetchWeatherDataByCity(String city) async {
    _isLoading = true;
    _error = "";

    //https://api.openweathermap.org/data/2.5/weather?q=calicut&appid=6e85118d0f380c857ca86591512dcdde&units=metric

    try {
      final apiUrl="${APIEndPoints().cityUrl}${city}&appid=${APIEndPoints().apiKey}${APIEndPoints().units}";
      final response=await http.get(Uri.parse(apiUrl));

      if (response.statusCode==200) {
        final data=jsonDecode(response.body);
        print('DATA : $data');

        _weather=WeatherModel.fromJson(data);
        print('WEATHER : ${_weather!.name}'); 
        notifyListeners();
      }else{
        _error="Failed to load data";
      }
    } catch (e) {
      _error="Failed to load data! $e"; 
    }finally{
      _isLoading=false;
      notifyListeners();
    }
  }
}
