part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({
    required this.token,
  });
}

final class AuthFailure extends AuthState {
  final String message;

  AuthFailure({
    required this.message,
  });
}

final class AuthLoading extends AuthState {}