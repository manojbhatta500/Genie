part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

final class MessageInitial extends MessageState {}

final class MessageSuccess extends MessageState {
  final String outputPrompt;
  MessageSuccess({required this.outputPrompt});
}

final class MessageFailed extends MessageState {}

final class MessageLoading extends MessageState {}
