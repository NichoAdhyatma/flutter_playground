import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  // @override
  // void onChange(Change<AuthState> change) {
  //   log(
  //     'AuthBloc $change',
  //     name: 'AuthBloc',
  //     time: DateTime.now(),
  //   );
  //   super.onChange(change);
  // }
  //
  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   log('AuthBloc Transition $transition', name: 'AuthBloc', time: DateTime.now());
  //   super.onTransition(transition);
  // }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      if (event.password.length < 6) {
        return emit(
          AuthFailure(message: 'Password must be at least 6 characters'),
        );
      } else {
        await Future.delayed(const Duration(seconds: 1));

        return emit(
          AuthSuccess(
            token: '${event.email}-${event.password}-${DateTime.now()}',
          ),
        );
      }
    } catch (e) {
      return emit(AuthFailure(message: e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
