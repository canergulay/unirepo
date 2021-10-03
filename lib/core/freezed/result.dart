import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unirepo/core/components/models/map_converter.dart';

part 'result.freezed.dart';

@freezed
class Result<S, E extends Exception> with _$Result<S, E> {
  const factory Result.success(S data) = _Success;
  const factory Result.error(E error) = _Error;
}
