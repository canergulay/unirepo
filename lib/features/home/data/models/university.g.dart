// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UniversityAdapter extends TypeAdapter<University> {
  @override
  final int typeId = 0;

  @override
  University read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return University(
      id: fields[1] as String?,
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, University obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UniversityAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

University _$UniversityFromJson(String documentID, Map<String, dynamic> json) {
  return University(
    id: documentID,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$UniversityToJson(University instance) => <String, dynamic>{
      'name': instance.name,
    };
