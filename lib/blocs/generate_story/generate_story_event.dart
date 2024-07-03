part of 'generate_story_bloc.dart';

sealed class GenerateStoryEvent extends Equatable {
  const GenerateStoryEvent();

  @override
  List<Object> get props => [];
}

final class GenerateStory extends GenerateStoryEvent {
  final String prompt;
  GenerateStory({required this.prompt});
}
