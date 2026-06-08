
import '../../../../core/networking/api_service.dart';
import '../model/delete_post_model/delete_post_response_body.dart';

class DeletePostRepo{
  final ApiService apiService;
  DeletePostRepo(this.apiService);

  Future<DeletePostResponseBody>deletePost(Map<String,dynamic> content)async{

    return await apiService.deletePost(content);
  }
}