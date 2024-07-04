import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/story_repository.dart';

part 'generate_song_event.dart';
part 'generate_song_state.dart';

class GenerateSongBloc extends Bloc<GenerateSongEvent, GenerateSongState> {
  SongRepository manager = SongRepository();
  GenerateSongBloc() : super(GenerateSongInitial()) {
    on<GenerateSong>(_generateSong);
  }

  FutureOr<void> _generateSong(
      GenerateSong event, Emitter<GenerateSongState> emit) async {
    emit(GenerateSongLoading());
    final repoResponse = await manager.generateSong(event.prompt);
    repoResponse.fold((l) {
      emit(GenerateSongFailed());
    }, (r) {
      emit(GenerateSongSuccess(promptResponse: r));
    });
  }
}
