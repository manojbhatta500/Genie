part of 'generate_song_bloc.dart';

sealed class GenerateSongEvent extends Equatable {
  const GenerateSongEvent();

  @override
  List<Object> get props => [];
}

class GenerateSong extends GenerateSongEvent {
  String prompt;
  GenerateSong({required this.prompt});
}
