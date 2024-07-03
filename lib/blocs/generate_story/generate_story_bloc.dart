import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/story_repository.dart';

part 'generate_story_event.dart';
part 'generate_story_state.dart';

class GenerateStoryBloc extends Bloc<GenerateStoryEvent, GenerateStoryState> {
  GenerateStoryBloc() : super(GenerateStoryInitial()) {
    on<GenerateStory>(_generateStory);
  }
  SongRepository manager = SongRepository();

  FutureOr<void> _generateStory(
      GenerateStory event, Emitter<GenerateStoryState> emit) async {
    emit(GenerateStoryLoading());
    final repoResponse = await manager.generateSong(event.prompt);
    log('this is story repository response ${repoResponse}');
    repoResponse.fold((l) {
      log('message repo response fold left run');
      emit(GenerateStoryFailed());
    }, (r) {
      log('message repo response fold right run');

      emit(GenerateStorySuccess(promptResponse: r));
    });
  }
}
