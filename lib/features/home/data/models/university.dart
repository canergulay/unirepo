import 'package:unirepo/core/components/models/base_from_json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'university.g.dart';

@JsonSerializable()
class University extends BaseResponseContract<University> {
  final String? name;
  final int? id;
  University({this.id, this.name});

  factory University.fromJson(Map<String, dynamic> json) => _$UniversityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UniversityToJson(this);

  @override
  University fromJson(Map<String, dynamic>? json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
