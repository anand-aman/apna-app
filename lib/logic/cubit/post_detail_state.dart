part of 'post_detail_cubit.dart';

@immutable
abstract class PostDetailState {}

class PostDetailInitial extends PostDetailState {
  PostDetailInitial();
}

class PostDetailLoading extends PostDetailState {
  PostDetailLoading();
}

class PostDetailLoaded extends PostDetailState {
  PostDetailLoaded();
}

class PostDetailError extends PostDetailState {
  PostDetailError();
}