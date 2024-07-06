part of 'fetch_content_bloc.dart';

sealed class FetchContentState extends Equatable {
  const FetchContentState();

  @override
  List<Object> get props => [];
}

final class FetchContentInitial extends FetchContentState {}

final class FetchContentLoading extends FetchContentState {}

final class FetchContentFailed extends FetchContentState {}

final class FetchContentSuccess extends FetchContentState {
  final ContentModel data;
  FetchContentSuccess({required this.data});
}
