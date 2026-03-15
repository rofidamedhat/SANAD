import 'package:sanad/feature/add_question/data/model/add_post_response_body.dart';

import '../../../../core/networking/api_service.dart';

class AddPostRepo{
  final ApiService apiService;
  AddPostRepo(this.apiService);

  Future<AddPostResponseBody>addPost(Map<String,dynamic> content)async{

    return await apiService.addPost(content);
  }
}