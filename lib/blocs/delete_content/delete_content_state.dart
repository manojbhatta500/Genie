part of 'delete_content_bloc.dart';

sealed class DeleteContentState extends Equatable {
  const DeleteContentState();

  @override
  List<Object> get props => [];
}

final class DeleteContentInitial extends DeleteContentState {}

final class DeleteContentLoading extends DeleteContentState {}

final class DeleteContentSuccess extends DeleteContentState {}

final class DeleteContentFailed extends DeleteContentState {}
