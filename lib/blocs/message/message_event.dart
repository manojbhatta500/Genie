part of 'message_bloc.dart';

sealed class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GenerateMessage extends MessageEvent {
  final String inputPrompt;
  GenerateMessage({required this.inputPrompt});
}
