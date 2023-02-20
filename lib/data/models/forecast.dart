import 'package:hive_flutter/hive_flutter.dart';

import 'current.dart';
import 'daily.dart';
part 'forecast.g.dart';

@HiveType(typeId: 2)
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
  @HiveField(0)
  late double lat;
  @HiveField(1)
  late double lon;
  @HiveField(2)
  late String timezone;
  @HiveField(3)
  late int timezoneOffset;
  @HiveField(4)
  late Current current;
  @HiveField(5)
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
