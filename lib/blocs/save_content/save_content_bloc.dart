import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/save_content_repository.dart';

part 'save_content_event.dart';
part 'save_content_state.dart';

class SaveContentBloc extends Bloc<SaveContentEvent, SaveContentState> {
  SaveContentBloc() : super(SaveContentInitial()) {
    on<SaveContent>(_savecontent);
  }
  SaveContentRepository manager = SaveContentRepository();

  FutureOr<void> _savecontent(
      SaveContent event, Emitter<SaveContentState> emit) async {
    emit(SaveContentLoading());
    final repoResponse = await manager.saveContent(
        title: event.title, content: event.content, type: event.type);

    if (repoResponse == true) {
      emit(SaveContentSuccess());
    } else {
      emit(SaveContentFailed());
    }
  }
}
