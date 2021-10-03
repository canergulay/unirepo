// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResultTearOff {
  const _$ResultTearOff();

  _Success<S, E> success<S, E extends Exception>(S data) {
    return _Success<S, E>(
      data,
    );
  }

  _Error<S, E> error<S, E extends Exception>(E error) {
    return _Error<S, E>(
      error,
    );
  }
}

/// @nodoc
const $Result = _$ResultTearOff();

/// @nodoc
mixin _$Result<S, E extends Exception> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S data) success,
    required TResult Function(E error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<S, E> value) success,
    required TResult Function(_Error<S, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<S, E extends Exception, $Res> {
  factory $ResultCopyWith(
          Result<S, E> value, $Res Function(Result<S, E>) then) =
      _$ResultCopyWithImpl<S, E, $Res>;
}

/// @nodoc
class _$ResultCopyWithImpl<S, E extends Exception, $Res>
    implements $ResultCopyWith<S, E, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<S, E> _value;
  // ignore: unused_field
  final $Res Function(Result<S, E>) _then;
}

/// @nodoc
abstract class _$SuccessCopyWith<S, E extends Exception, $Res> {
  factory _$SuccessCopyWith(
          _Success<S, E> value, $Res Function(_Success<S, E>) then) =
      __$SuccessCopyWithImpl<S, E, $Res>;
  $Res call({S data});
}

/// @nodoc
class __$SuccessCopyWithImpl<S, E extends Exception, $Res>
    extends _$ResultCopyWithImpl<S, E, $Res>
    implements _$SuccessCopyWith<S, E, $Res> {
  __$SuccessCopyWithImpl(
      _Success<S, E> _value, $Res Function(_Success<S, E>) _then)
      : super(_value, (v) => _then(v as _Success<S, E>));

  @override
  _Success<S, E> get _value => super._value as _Success<S, E>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Success<S, E>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as S,
    ));
  }
}

/// @nodoc

class _$_Success<S, E extends Exception> implements _Success<S, E> {
  const _$_Success(this.data);

  @override
  final S data;

  @override
  String toString() {
    return 'Result<$S, $E>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<S, E> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<S, E, _Success<S, E>> get copyWith =>
      __$SuccessCopyWithImpl<S, E, _Success<S, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S data) success,
    required TResult Function(E error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<S, E> value) success,
    required TResult Function(_Error<S, E> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<S, E extends Exception> implements Result<S, E> {
  const factory _Success(S data) = _$_Success<S, E>;

  S get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<S, E, _Success<S, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<S, E extends Exception, $Res> {
  factory _$ErrorCopyWith(
          _Error<S, E> value, $Res Function(_Error<S, E>) then) =
      __$ErrorCopyWithImpl<S, E, $Res>;
  $Res call({E error});
}

/// @nodoc
class __$ErrorCopyWithImpl<S, E extends Exception, $Res>
    extends _$ResultCopyWithImpl<S, E, $Res>
    implements _$ErrorCopyWith<S, E, $Res> {
  __$ErrorCopyWithImpl(_Error<S, E> _value, $Res Function(_Error<S, E>) _then)
      : super(_value, (v) => _then(v as _Error<S, E>));

  @override
  _Error<S, E> get _value => super._value as _Error<S, E>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error<S, E>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$_Error<S, E extends Exception> implements _Error<S, E> {
  const _$_Error(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'Result<$S, $E>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error<S, E> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<S, E, _Error<S, E>> get copyWith =>
      __$ErrorCopyWithImpl<S, E, _Error<S, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(S data) success,
    required TResult Function(E error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(S data)? success,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Success<S, E> value) success,
    required TResult Function(_Error<S, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Success<S, E> value)? success,
    TResult Function(_Error<S, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<S, E extends Exception> implements Result<S, E> {
  const factory _Error(E error) = _$_Error<S, E>;

  E get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<S, E, _Error<S, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
