part of 'save_content_bloc.dart';

sealed class SaveContentState extends Equatable {
  const SaveContentState();

  @override
  List<Object> get props => [];
}

final class SaveContentInitial extends SaveContentState {}

final class SaveContentLoading extends SaveContentState {}

final class SaveContentSuccess extends SaveContentState {}

final class SaveContentFailed extends SaveContentState {}
