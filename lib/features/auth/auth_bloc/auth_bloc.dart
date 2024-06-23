import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:genie/features/auth/repository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_loginevent);
    on<SignupEvent>(_signupevent);
  }

  AuthRepository manager = AuthRepository();

  FutureOr<void> _loginevent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
  }

  FutureOr<void> _signupevent(
      SignupEvent event, Emitter<AuthState> emit) async {
    emit(SignupLoading());

    final repoResponse =
        await manager.signUp(event.username, event.email, event.password);
    if (repoResponse == 1) {
      emit(SignupSuccess());
    } else {
      emit(SignupFailed());
    }
  }
}
