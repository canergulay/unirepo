import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.unauthenticated() = _UnAuthenticated;
  const factory AuthenticationState.authenticated(User user) = _Authenticated;
  const factory AuthenticationState.needsverification(User user) = _NeedsVerification;
}
