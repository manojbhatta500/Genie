import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_content_event.dart';
part 'fetch_content_state.dart';

class FetchContentBloc extends Bloc<FetchContentEvent, FetchContentState> {
  FetchContentBloc() : super(FetchContentInitial()) {
    on<FetchContentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
