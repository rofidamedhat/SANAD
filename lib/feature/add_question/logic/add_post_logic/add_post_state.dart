part of 'add_post_cubit.dart';

@immutable
sealed class AddPostState {}

final class AddPostInitial extends AddPostState {}

class AddPostLoading extends AddPostState{}

class AddPostWithError extends AddPostState{
  ApiErrorModel apiErrorModel;

  AddPostWithError({required this.apiErrorModel});
}

class AddPostSuccessfully extends AddPostState{

  AddPostResponseBody addPostResponseBody;

  AddPostSuccessfully({required this.addPostResponseBody});
}