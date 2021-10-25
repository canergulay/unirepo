// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      courseCode: json['courseCode'] as int?,
      numberOfNotes: json['numberOfNotes'] as int?,
      coursePrefix: json['coursePrefix'] == null ? null : CoursePrefix.fromJson(json['coursePrefix'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      kredi: json['courseCode'] as int?,
      created: json['created'] == null ? null : DateTime.parse(json['created'] as String),
      explanation: json['explanation'] as String?,
      title: json['title'] as String?,
      universityId: json['universityId'] as String?,
      user: json['user'] == null ? null : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'courseCode': instance.courseCode,
      'coursePrefix': instance.coursePrefix,
      'documents': instance.documents,
      'explanation': instance.explanation,
      'user': instance.user,
      'title': instance.title,
      'numberOfNotes': instance.numberOfNotes,
      'created': instance.created?.toIso8601String(),
      'universityId': instance.universityId,
    };
