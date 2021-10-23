import 'package:json_annotation/json_annotation.dart';
import 'package:unirepo/core/components/models/map_converter.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile extends SingleDocConverter {
  final String? name;
  final String? picture;
  final int? credits;
  final String? universityName;
  UserProfile({
    this.credits,
    this.name,
    this.picture,
    this.universityName,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @override
  fromJson(Map<String, dynamic>? json) {
    return _$UserProfileFromJson(json ?? {});
  }
}
