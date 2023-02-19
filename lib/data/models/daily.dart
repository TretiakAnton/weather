import 'package:weather/data/models/temp.dart';
import 'package:weather/data/models/weather.dart';
import 'feels_like.dart';

class Daily {
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
  });

  Daily.fromJson(dynamic json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'].toDouble();
    temp = (json['temp'] != null ? Temp.fromJson(json['temp']) : null)!;
    feelsLike = (json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null)!;
    pressure = json['pressure'];
    humidity = json['humidity'];
    dewPoint = json['dew_point'].toDouble();
    windSpeed = json['wind_speed'].toDouble();
    windDeg = json['wind_deg'];
    windGust = json['wind_gust'];
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'];
    pop = json['pop'].toDouble();
    uvi = json['uvi'].toDouble();
  }

  late int dt;
  late int sunrise;
  late int sunset;
  late int moonrise;
  late int moonset;
  late double moonPhase;
  late Temp temp;
  late FeelsLike feelsLike;
  late int pressure;
  late int humidity;
  late double dewPoint;
  late double windSpeed;
  late int windDeg;
  late double windGust;
  late List<Weather> weather;
  late int clouds;
  late double pop;
  late double uvi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    map['temp'] = temp.toJson();
    map['feels_like'] = feelsLike.toJson();
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['dew_point'] = dewPoint;
    map['wind_speed'] = windSpeed;
    map['wind_deg'] = windDeg;
    map['wind_gust'] = windGust;
    map['weather'] = weather.map((v) => v.toJson()).toList();
    map['clouds'] = clouds;
    map['pop'] = pop;
    map['uvi'] = uvi;
    return map;
  }
}
