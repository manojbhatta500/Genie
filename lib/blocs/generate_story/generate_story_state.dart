part of 'generate_story_bloc.dart';

sealed class GenerateStoryState extends Equatable {
  const GenerateStoryState();

  @override
  List<Object> get props => [];
}

final class GenerateStoryInitial extends GenerateStoryState {}

final class GenerateStorySuccess extends GenerateStoryState {
  final String promptResponse;
  GenerateStorySuccess({required this.promptResponse});
}

final class GenerateStoryFailed extends GenerateStoryState {}

final class GenerateStoryLoading extends GenerateStoryState {}
