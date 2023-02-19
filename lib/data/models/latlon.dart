import 'package:hive/hive.dart';
part 'latlon.g.dart';

@HiveType(typeId: 1)
class LatLon {
  LatLon({
    required this.lat,
    required this.lon,
  });

  LatLon.fromJson(List<dynamic> json) {
    lat = json.first['lat'];
    lon = json.first['lon'];
  }

  @HiveField(0)
  late double lat;
  @HiveField(1)
  late double lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}
