import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/core/networking/api_error_model.dart';
import 'package:sanad/core/networking/api_result.dart';
import 'package:sanad/feature/learn_videos/data/model/learn_videos_model.dart';
import 'package:sanad/feature/learn_videos/data/repo/learn_videos_repo.dart';

part 'learn_videos_state.dart';

class LearnVideosCubit extends Cubit<LearnVideosState> {
  LearnVideosCubit(this.videosRepo) : super(LearnVideosInitial());

  final LearnVideosRepo videosRepo;

  Future<void> getVideos() async {
    emit(LearnVideosLoadingState());

    final response = await videosRepo.getVideos();

    if (response is Success<LearnVideosModel>) {
      emit(LearnVideosSuccessState(response.data.data));
    } else if (response is Failure<LearnVideosModel>) {
      emit(LearnVideosErrorState(response.apiErrorModel));
    }
  }

 
}
