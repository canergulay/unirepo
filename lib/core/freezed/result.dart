import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<S, E extends Exception> with _$Result {
  const factory Result.success(S data) = _Success;
  const factory Result.error(E error) = _Error;
}
