import 'package:unirepo/core/components/models/map_converter.dart';
import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:unirepo/features/user/data/models/user.dart';

part 'note.g.dart';

@JsonSerializable()
class Note implements MapConverter {
  final int? courseCode;
  final CoursePrefix? coursePrefix;
  final List<String?>? documents;
  final String? explanation;
  final User? user;
  final String? title;
  final int? numberOfNotes;
  final DateTime? created;
  final String? universityId;
  Note(
      {this.courseCode,
      this.numberOfNotes,
      this.coursePrefix,
      this.documents,
      this.created,
      this.explanation,
      this.title,
      this.universityId,
      this.user});

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  fromJson(String documentId, Map<String, dynamic>? json) {
    return _$NoteFromJson(json ?? {});
  }
}
