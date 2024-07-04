import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genie/repository/message_repository.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository manager = MessageRepository();

  MessageBloc() : super(MessageInitial()) {
    on<GenerateMessage>(_generateMessage);
  }

  FutureOr<void> _generateMessage(
      GenerateMessage event, Emitter<MessageState> emit) async {
    emit(MessageLoading());
    final repoResponse = await manager.generateMessage(event.inputPrompt);
    repoResponse.fold((l) {
      log('this is a message bloc failed state running');
      emit(MessageFailed());
    }, (r) {
      log('this is a message bloc success state running');

      emit(MessageSuccess(outputPrompt: r));
    });
  }
}
