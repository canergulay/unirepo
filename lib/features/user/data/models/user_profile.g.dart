// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      credits: json['credits'] as int?,
      name: json['name'] as String?,
      picture: json['picture'] as String?,
      universityName: json['universityName'] as String?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) => <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'credits': instance.credits,
      'universityName': instance.universityName,
    };
