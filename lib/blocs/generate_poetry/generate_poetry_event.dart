part of 'generate_poetry_bloc.dart';

sealed class GeneratePoetryEvent extends Equatable {
  const GeneratePoetryEvent();

  @override
  List<Object> get props => [];
}

final class GeneratePoetry extends GeneratePoetryEvent {
  final String prompt;
  GeneratePoetry({required this.prompt});
}
