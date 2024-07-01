import 'package:bloc/bloc.dart';
import 'package:genie/repository/normol_chat_repository.dart';
import 'package:meta/meta.dart';
import 'normal_chat_event.dart';
import 'normal_chat_state.dart';

class NormalChatBloc extends Bloc<NormalChatEvent, NormalChatState> {
  final NormolChatRepository manager = NormolChatRepository();

  NormalChatBloc() : super(NormalChatInitial()) {
    on<SendUserChat>(_handleSendUserChat);
  }

  void _handleSendUserChat(
      SendUserChat event, Emitter<NormalChatState> emit) async {
    final currentState = state;

    List<String> updatedMessages = [];
    if (currentState is NormalChatInitial) {
      updatedMessages = List.from(currentState.messages);
    } else if (currentState is NormalChatSuccess) {
      updatedMessages = List.from(currentState.messages);
    } else if (currentState is NormalChatLoading) {
      updatedMessages = List.from(currentState.messages);
    }

    // Add the user's message to the list
    updatedMessages.add("User: ${event.userString}");

    emit(NormalChatLoading(loadingMessages: updatedMessages));

    try {
      final repoResponse = await manager.normolChatFunction(event.userString);

      // Add the bot's response to the list
      updatedMessages.add("Bot: $repoResponse");

      emit(NormalChatSuccess(successMessages: updatedMessages));
    } catch (e) {
      emit(NormalChatFailed(failedMessages: updatedMessages));
    }
  }
}
