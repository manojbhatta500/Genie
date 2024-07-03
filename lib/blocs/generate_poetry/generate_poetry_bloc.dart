import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/poetry_repository.dart';

part 'generate_poetry_event.dart';
part 'generate_poetry_state.dart';

class GeneratePoetryBloc
    extends Bloc<GeneratePoetryEvent, GeneratePoetryState> {
  PoetryRepository manager = PoetryRepository();
  GeneratePoetryBloc() : super(GeneratePoetryInitial()) {
    on<GeneratePoetry>(_generatePoetry);
  }

  FutureOr<void> _generatePoetry(
      GeneratePoetry event, Emitter<GeneratePoetryState> emit) async {
    emit(GeneratePoetryLoading());
    final repoResponse = await manager.generatePoem(event.prompt);
    repoResponse.fold((l) {
      log('generate poetry bloc fold left');

      emit(GeneratePoetryFailed());
    }, (r) {
      log('generate poetry bloc fold right');
      emit(GeneratePoetrySuccess(promptResult: r));
    });
  }
}
