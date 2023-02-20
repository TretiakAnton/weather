import 'dart:convert';

//import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:weather/data/models/forecast.dart';
import 'package:weather/data/models/latlon.dart';

class WeatherRepo {
  final apiKey = '96bc4f42f4b0c861ed2e623189ccadc3';
/*  Box cities = Hive.box('savedCities');
  Box forecastBox = Hive.box('lastForecast');*/

  Future<Forecast> getWeather(
    String city,
    bool isImperial,
  ) async {
    String location = city;
    final String units;
    if (isImperial) {
      units = 'imperial';
    } else {
      units = 'metric';
    }
    final latLonUri = Uri.parse(
        'http://api.openweathermap.org/geo/1.0/direct?q=$location&limit=1&appid=$apiKey');
    final latLonResponse = await http.get(latLonUri);
    final latLon = LatLon.fromJson(jsonDecode(latLonResponse.body));
    //cities.put('city', latLon);
    final weatherUri = Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=${latLon.lat}&lon=${latLon.lon}&exclude=hourly,minutely,alerts&appid=96bc4f42f4b0c861ed2e623189ccadc3&units=$units');
    final weatherResponse = await http.get(weatherUri);
    var forecast = Forecast.fromJson(jsonDecode(weatherResponse.body));
    //forecastBox.put('lastForecast', forecast);
    return forecast;
  }
}
