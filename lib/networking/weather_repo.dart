import 'package:http/http.dart' as http;

class WeatherRepo {
  final apiKey = '96bc4f42f4b0c861ed2e623189ccadc3';

  getWeather(String city, String state, String country) async {
    String location = city;
    if (country == 'USA') {
      location += ',$state';
    }
    var uri = Uri.https('http://api.openweathermap.org',
        'geo/1.0/direct?q=$location&limit=1&appid=$apiKey');
    print(uri);
    final response = http.get(uri);
  }
}
