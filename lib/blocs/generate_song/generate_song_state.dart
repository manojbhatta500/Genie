part of 'generate_song_bloc.dart';

sealed class GenerateSongState extends Equatable {
  const GenerateSongState();

  @override
  List<Object> get props => [];
}

final class GenerateSongInitial extends GenerateSongState {}

final class GenerateSongLoading extends GenerateSongState {}

final class GenerateSongSuccess extends GenerateSongState {
  String promptResponse;
  GenerateSongSuccess({required this.promptResponse});
}

final class GenerateSongFailed extends GenerateSongState {}
