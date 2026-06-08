part of 'post_details_cubit.dart';

@immutable
sealed class PostDetailsState {}

final class PostDetailsInitial extends PostDetailsState {}

class DeletePostLoading extends PostDetailsState{}

class DeletePostWithError extends PostDetailsState{

  ApiErrorModel apiErrorModel;
  DeletePostWithError({required this.apiErrorModel});
}

class DeletePostSuccessfully extends PostDetailsState{

  DeletePostResponseBody deletePostResponseBody;

  DeletePostSuccessfully({required this.deletePostResponseBody});
}