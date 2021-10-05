import 'package:json_annotation/json_annotation.dart';

part 'course_prefix.g.dart';

@JsonSerializable()
class CoursePrefix {
  final String? prefix;
  final String? id;
  const CoursePrefix({required this.prefix, required this.id});

  factory CoursePrefix.fromJson(Map<String, dynamic> json) => _$CoursePrefixFromJson(json);
  Map<String, dynamic> toJson() => _$CoursePrefixToJson(this);
}
