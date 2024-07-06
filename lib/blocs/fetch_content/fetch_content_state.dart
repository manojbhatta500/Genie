part of 'fetch_content_bloc.dart';

sealed class FetchContentState extends Equatable {
  const FetchContentState();
  
  @override
  List<Object> get props => [];
}

final class FetchContentInitial extends FetchContentState {}
