part of 'get_post_cubit.dart';

@immutable
sealed class GetPostState {}

final class GetPostInitial extends GetPostState {}

class GetPostLoading extends GetPostState{}
class GetPostWithError extends GetPostState{

  ApiErrorModel apiErrorModel;
  GetPostWithError({required this.apiErrorModel});
}

class GetPostSuccessfully extends GetPostState{

  GetPostResponseBody getPostResponseBody;

  GetPostSuccessfully({required this.getPostResponseBody});
}
