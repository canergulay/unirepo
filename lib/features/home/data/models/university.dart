import 'package:hive/hive.dart';
import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university.g.dart';

@HiveType(typeId: 0)
class University extends HiveObject implements MapConverter {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? id;
  University({this.id, this.name});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UniversityToJson(this);

  @override
  University fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    return University.fromJson(json ?? {});
  }
}
