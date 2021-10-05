import 'package:unirepo/features/home/data/models/course_prefix/course_prefix.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_prefix_result.freezed.dart';

@freezed
class CoursePrefixState with _$CoursePrefixState {
  const factory CoursePrefixState.loading() = _Loading;
  const factory CoursePrefixState.loaded(List<CoursePrefix> coursePrefices) = _Loaded;
  const factory CoursePrefixState.error([String? message]) = _ErrorDetails;
}
