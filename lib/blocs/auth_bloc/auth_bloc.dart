import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:genie/models/login_model.dart';
import 'package:genie/repository/auth_repository.dart';
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
    log('this is email checker : ${event.email}');
    final repoResponse = await manager.login(event.email, event.password);

    repoResponse.fold((l) {
      emit(LoginFailed());
    }, (r) {
      emit(LoginSuccess(data: r));
    });
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
