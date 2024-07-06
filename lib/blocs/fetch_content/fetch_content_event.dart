part of 'fetch_content_bloc.dart';

sealed class FetchContentEvent extends Equatable {
  const FetchContentEvent();

  @override
  List<Object> get props => [];
}

final class FetchContent extends FetchContentEvent {}
