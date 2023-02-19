import 'current.dart';
import 'daily.dart';

class Forecast {
  Forecast({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.daily,
  });

  Forecast.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    if (json['current'] != null) {
      current = Current.fromJson(json['current']);
    }
    if (json['daily'] != null) {
      daily = [];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v));
      });
    }
  }

  late double lat;
  late double lon;
  late String timezone;
  late int timezoneOffset;
  late Current current;
  late List<Daily> daily;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    map['timezone'] = timezone;
    map['timezone_offset'] = timezoneOffset;
    map['current'] = current.toJson();
    map['daily'] = daily.map((v) => v.toJson()).toList();
    return map;
  }
}
