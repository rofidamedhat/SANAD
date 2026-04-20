import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanad/core/networking/api_error_handler.dart';
import 'package:sanad/feature/share_question/data/model/get_post_response_body.dart';
import 'package:sanad/feature/share_question/data/repo/get_post_repo.dart';

import '../../../core/networking/api_error_model.dart';

part 'get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostRepo getPostRepo;
  GetPostCubit(this.getPostRepo) : super(GetPostInitial());

  GetPostResponseBody? getPostResponseBody;
  bool isLoading=true;

  void getPost()async{

    emit(GetPostLoading());
    try{
      getPostResponseBody=await getPostRepo.getPost();

      if(getPostResponseBody!.statusCode==200){

        emit(GetPostSuccessfully(getPostResponseBody: getPostResponseBody!));
        isLoading=false;
      }
      else{
        emit(GetPostWithError(apiErrorModel: ApiErrorHandler.handle(getPostResponseBody)));
        isLoading=false;
      }

    }catch(error,stackTrace){
      print("Error from cubit $error");
      print("Stack trace from get post $stackTrace");
      emit(GetPostWithError(apiErrorModel: ApiErrorHandler.handle(error)));
      isLoading=false;
    }
  }
}
