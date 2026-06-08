import 'package:sanad/feature/share_question/data/model/get_post_model/get_post_response_body.dart';

import '../../../../core/networking/api_service.dart';

class GetPostRepo{

  final ApiService apiService;
  GetPostRepo(this.apiService);

  Future<GetPostResponseBody>getPost()async{

    return await apiService.getPost();
  }

<<<<<<< HEAD
}
=======
//   Future<DeletePostResponseBody>deletePost(Map<String,dynamic> content)async{
//
//     return await apiService.deletePost(content);
//   }
 }
>>>>>>> d8a51824af41532fe8e58c487ee37737f0267e76
