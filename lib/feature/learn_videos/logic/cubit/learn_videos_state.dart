part of 'learn_videos_cubit.dart';

@immutable
sealed class LearnVideosState {}

final class LearnVideosInitial extends LearnVideosState {}

class LearnVideosLoadingState extends LearnVideosState {}



class LearnVideosSuccessState extends LearnVideosState {
  final List<VideoModel> videosList;
  LearnVideosSuccessState(this.videosList);
}

class LearnVideosErrorState extends LearnVideosState {
  final ApiErrorModel apiErrorModel;
  LearnVideosErrorState(this.apiErrorModel);
}
