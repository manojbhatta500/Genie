part of 'generate_poetry_bloc.dart';

sealed class GeneratePoetryState extends Equatable {
  const GeneratePoetryState();

  @override
  List<Object> get props => [];
}

final class GeneratePoetryInitial extends GeneratePoetryState {}

final class GeneratePoetrySuccess extends GeneratePoetryState {
  String promptResult;
  GeneratePoetrySuccess({required this.promptResult});
}

final class GeneratePoetryFailed extends GeneratePoetryState {}

final class GeneratePoetryLoading extends GeneratePoetryState {}
