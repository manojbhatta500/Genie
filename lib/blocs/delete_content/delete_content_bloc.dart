import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/delete_content_repository.dart';

part 'delete_content_event.dart';
part 'delete_content_state.dart';

class DeleteContentBloc extends Bloc<DeleteContentEvent, DeleteContentState> {
  DeleteContentBloc() : super(DeleteContentInitial()) {
    on<DeleteContent>(_deleteContent);
  }

  DeleteContentRepository manager = DeleteContentRepository();

  FutureOr<void> _deleteContent(
      DeleteContent event, Emitter<DeleteContentState> emit) async {
    emit(DeleteContentLoading());
    final repoResponse = manager.deleteContent(event.id);
    if (repoResponse == true) {
      log('delete content successfully deleted');
      emit(DeleteContentSuccess());
    } else {
      log('delete content did not  deleted');

      emit(DeleteContentFailed());
    }
  }
}
