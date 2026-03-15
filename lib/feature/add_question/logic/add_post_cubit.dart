import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/feature/add_question/data/model/add_post_response_body.dart';
import 'package:sanad/feature/add_question/data/repo/add_post_repo.dart';

import '../../../core/networking/api_error_model.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {

  AddPostRepo addPostRepo;
  AddPostCubit(this.addPostRepo) : super(AddPostInitial());

  AddPostResponseBody? addPostResponseBody;
  void addPost(Map<String,dynamic> content)async{
    emit(AddPostLoading());

    try{
      addPostResponseBody = await addPostRepo.addPost(content);

      if(addPostResponseBody!.statusCode==200){
        emit(AddPostSuccessfully(addPostResponseBody: addPostResponseBody!));
      }
      else{
        emit(AddPostWithError(apiErrorModel: ApiErrorHandler.handle(addPostResponseBody)));
      }

    }catch(error,stackTrace){
      print("error from cubit $error");
      print("stack Trace is $stackTrace");
      emit(AddPostWithError(apiErrorModel: ApiErrorHandler.handle(error)));
    }
  }
}
