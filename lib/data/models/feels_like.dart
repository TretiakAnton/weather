class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  FeelsLike.fromJson(dynamic json) {
    day = json['day'].toDouble();
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'].toDouble();
  }
  late double day;
  late double night;
  late double eve;
  late double morn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['night'] = night;
    map['eve'] = eve;
    map['morn'] = morn;
    return map;
  }
}
