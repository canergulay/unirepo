import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_state.freezed.dart';

@freezed
class FetchState<T, E extends Exception> with _$FetchState<T, E> {
  const factory FetchState.loading() = _Loading;
  const factory FetchState.loaded(T data) = _Loaded;
  const factory FetchState.error(E error) = _ErrorDetails;
}
