part of 'delete_content_bloc.dart';

sealed class DeleteContentEvent extends Equatable {
  const DeleteContentEvent();

  @override
  List<Object> get props => [];
}

final class DeleteContent extends DeleteContentEvent {
  final String id;
  DeleteContent({required this.id});
}
