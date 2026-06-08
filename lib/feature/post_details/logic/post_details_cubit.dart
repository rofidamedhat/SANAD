import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sanad/feature/post_details/data/repo/delete_post_repo.dart';

import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/api_error_model.dart';
import '../data/model/delete_post_model/delete_post_response_body.dart';

part 'post_details_state.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {

  DeletePostRepo deletePostRepo;
  PostDetailsCubit(this.deletePostRepo) : super(PostDetailsInitial());

  DeletePostResponseBody? deletePostResponseBody;
  void deletePost(Map<String,dynamic>content)async{
    emit( DeletePostLoading());

    try{
      deletePostResponseBody= await deletePostRepo.deletePost(content);
      if(deletePostResponseBody!.statusCode==200){
        emit(DeletePostSuccessfully(deletePostResponseBody: deletePostResponseBody!));
      }
      else{
        emit(DeletePostWithError(apiErrorModel: ApiErrorHandler.handle(deletePostResponseBody)));
      }
    }catch(error,stackTrace){
      print("Error from delete post cubit $error");
      print("Stack trace from delete post cubit $stackTrace");
      emit(DeletePostWithError(apiErrorModel: ApiErrorHandler.handle(error)));
    }
  }
}
