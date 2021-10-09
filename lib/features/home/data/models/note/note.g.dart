// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  print(json['created']);
  print('note burada');
  return Note(
    courseCode: json['courseCode'] as int?,
    // coursePrefix: json['course_prefix'] == null ? null : CoursePrefix.fromJson(json['coursePrefix'] as Map<String, dynamic>),
    documents: (json['documents'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    explanation: json['explanation'] as String?,
    title: json['title'] as String?,
    universityId: json['university_id'] as String?,
    user: json['shared_by'] == null ? null : User.fromJson(json['shared_by'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'courseCode': instance.courseCode,
      'coursePrefix': instance.coursePrefix,
      'documents': instance.documents,
      'explanation': instance.explanation,
      'user': instance.user,
      'title': instance.title,
      'universityId': instance.universityId,
    };
