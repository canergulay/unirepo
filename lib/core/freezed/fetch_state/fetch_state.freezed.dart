// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fetch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FetchStateTearOff {
  const _$FetchStateTearOff();

  _Loading<T, E> loading<T, E extends Exception>() {
    return _Loading<T, E>();
  }

  _Loaded<T, E> loaded<T, E extends Exception>(T data) {
    return _Loaded<T, E>(
      data,
    );
  }

  _ErrorDetails<T, E> error<T, E extends Exception>(E error) {
    return _ErrorDetails<T, E>(
      error,
    );
  }
}

/// @nodoc
const $FetchState = _$FetchStateTearOff();

/// @nodoc
mixin _$FetchState<T, E extends Exception> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T, E> value) loading,
    required TResult Function(_Loaded<T, E> value) loaded,
    required TResult Function(_ErrorDetails<T, E> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchStateCopyWith<T, E extends Exception, $Res> {
  factory $FetchStateCopyWith(
          FetchState<T, E> value, $Res Function(FetchState<T, E>) then) =
      _$FetchStateCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class _$FetchStateCopyWithImpl<T, E extends Exception, $Res>
    implements $FetchStateCopyWith<T, E, $Res> {
  _$FetchStateCopyWithImpl(this._value, this._then);

  final FetchState<T, E> _value;
  // ignore: unused_field
  final $Res Function(FetchState<T, E>) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<T, E extends Exception, $Res> {
  factory _$LoadingCopyWith(
          _Loading<T, E> value, $Res Function(_Loading<T, E>) then) =
      __$LoadingCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<T, E extends Exception, $Res>
    extends _$FetchStateCopyWithImpl<T, E, $Res>
    implements _$LoadingCopyWith<T, E, $Res> {
  __$LoadingCopyWithImpl(
      _Loading<T, E> _value, $Res Function(_Loading<T, E>) _then)
      : super(_value, (v) => _then(v as _Loading<T, E>));

  @override
  _Loading<T, E> get _value => super._value as _Loading<T, E>;
}

/// @nodoc

class _$_Loading<T, E extends Exception> implements _Loading<T, E> {
  const _$_Loading();

  @override
  String toString() {
    return 'FetchState<$T, $E>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T, E> value) loading,
    required TResult Function(_Loaded<T, E> value) loaded,
    required TResult Function(_ErrorDetails<T, E> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T, E extends Exception> implements FetchState<T, E> {
  const factory _Loading() = _$_Loading<T, E>;
}

/// @nodoc
abstract class _$LoadedCopyWith<T, E extends Exception, $Res> {
  factory _$LoadedCopyWith(
          _Loaded<T, E> value, $Res Function(_Loaded<T, E>) then) =
      __$LoadedCopyWithImpl<T, E, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$LoadedCopyWithImpl<T, E extends Exception, $Res>
    extends _$FetchStateCopyWithImpl<T, E, $Res>
    implements _$LoadedCopyWith<T, E, $Res> {
  __$LoadedCopyWithImpl(
      _Loaded<T, E> _value, $Res Function(_Loaded<T, E>) _then)
      : super(_value, (v) => _then(v as _Loaded<T, E>));

  @override
  _Loaded<T, E> get _value => super._value as _Loaded<T, E>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Loaded<T, E>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Loaded<T, E extends Exception> implements _Loaded<T, E> {
  const _$_Loaded(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'FetchState<$T, $E>.loaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded<T, E> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<T, E, _Loaded<T, E>> get copyWith =>
      __$LoadedCopyWithImpl<T, E, _Loaded<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E error) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T, E> value) loading,
    required TResult Function(_Loaded<T, E> value) loaded,
    required TResult Function(_ErrorDetails<T, E> value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded<T, E extends Exception> implements FetchState<T, E> {
  const factory _Loaded(T data) = _$_Loaded<T, E>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<T, E, _Loaded<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorDetailsCopyWith<T, E extends Exception, $Res> {
  factory _$ErrorDetailsCopyWith(
          _ErrorDetails<T, E> value, $Res Function(_ErrorDetails<T, E>) then) =
      __$ErrorDetailsCopyWithImpl<T, E, $Res>;
  $Res call({E error});
}

/// @nodoc
class __$ErrorDetailsCopyWithImpl<T, E extends Exception, $Res>
    extends _$FetchStateCopyWithImpl<T, E, $Res>
    implements _$ErrorDetailsCopyWith<T, E, $Res> {
  __$ErrorDetailsCopyWithImpl(
      _ErrorDetails<T, E> _value, $Res Function(_ErrorDetails<T, E>) _then)
      : super(_value, (v) => _then(v as _ErrorDetails<T, E>));

  @override
  _ErrorDetails<T, E> get _value => super._value as _ErrorDetails<T, E>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_ErrorDetails<T, E>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
    ));
  }
}

/// @nodoc

class _$_ErrorDetails<T, E extends Exception> implements _ErrorDetails<T, E> {
  const _$_ErrorDetails(this.error);

  @override
  final E error;

  @override
  String toString() {
    return 'FetchState<$T, $E>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorDetails<T, E> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorDetailsCopyWith<T, E, _ErrorDetails<T, E>> get copyWith =>
      __$ErrorDetailsCopyWithImpl<T, E, _ErrorDetails<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T data) loaded,
    required TResult Function(E error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
    TResult Function(E error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T data)? loaded,
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
    required TResult Function(_Loading<T, E> value) loading,
    required TResult Function(_Loaded<T, E> value) loaded,
    required TResult Function(_ErrorDetails<T, E> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T, E> value)? loading,
    TResult Function(_Loaded<T, E> value)? loaded,
    TResult Function(_ErrorDetails<T, E> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorDetails<T, E extends Exception>
    implements FetchState<T, E> {
  const factory _ErrorDetails(E error) = _$_ErrorDetails<T, E>;

  E get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorDetailsCopyWith<T, E, _ErrorDetails<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
