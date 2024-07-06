part of 'save_content_bloc.dart';

sealed class SaveContentEvent extends Equatable {
  const SaveContentEvent();

  @override
  List<Object> get props => [];
}

final class SaveContent extends SaveContentEvent {
  final String title, content, type;
  SaveContent({required this.title, required this.content, required this.type});
}
