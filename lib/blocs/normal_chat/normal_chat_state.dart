import 'package:equatable/equatable.dart';

abstract class NormalChatState extends Equatable {
  const NormalChatState();

  List<String> get messages => [];

  @override
  List<Object> get props => [];
}

class NormalChatInitial extends NormalChatState {
  final List<String> initialMessages;

  NormalChatInitial({this.initialMessages = const []});

  @override
  List<String> get messages => initialMessages;

  @override
  List<Object> get props => [initialMessages];
}

class NormalChatLoading extends NormalChatState {
  final List<String> loadingMessages;

  NormalChatLoading({this.loadingMessages = const []});

  @override
  List<String> get messages => loadingMessages;

  @override
  List<Object> get props => [loadingMessages];
}

class NormalChatSuccess extends NormalChatState {
  final List<String> successMessages;

  const NormalChatSuccess({required this.successMessages});

  @override
  List<String> get messages => successMessages;

  @override
  List<Object> get props => [successMessages];
}

class NormalChatFailed extends NormalChatState {
  final List<String> failedMessages;

  NormalChatFailed({this.failedMessages = const []});

  @override
  List<String> get messages => failedMessages;

  @override
  List<Object> get props => [failedMessages];
}
