// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latlon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LatLonAdapter extends TypeAdapter<LatLon> {
  @override
  final int typeId = 1;

  @override
  LatLon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LatLon(
      lat: fields[0] as double,
      lon: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, LatLon obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LatLonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
