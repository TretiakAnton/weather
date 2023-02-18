class LatLon {
  LatLon({
    required this.lat,
    required this.lon,
  });

  LatLon.fromJson(dynamic json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  late double lat;
  late double lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}
