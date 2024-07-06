import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/models/content_model.dart';
import 'package:genie/repository/fetch_content_repository.dart';

part 'fetch_content_event.dart';
part 'fetch_content_state.dart';

class FetchContentBloc extends Bloc<FetchContentEvent, FetchContentState> {
  FetchContentBloc() : super(FetchContentInitial()) {
    on<FetchContent>(_fetchcontent);
  }
  FetchContentRepository manager = FetchContentRepository();

  FutureOr<void> _fetchcontent(
      FetchContent event, Emitter<FetchContentState> emit) async {
    emit(FetchContentLoading());
    final repoResponse = await manager.fetchContent();
    repoResponse.fold((l) {
      emit(FetchContentFailed());
    }, (r) {
      emit(FetchContentSuccess(data: r));
    });
  }
}
