import 'package:sanad/feature/share_question/data/model/get_post_response_body.dart';

import '../../../../core/networking/api_service.dart';

class GetPostRepo{

  final ApiService apiService;
  GetPostRepo(this.apiService);

  Future<GetPostResponseBody>getPost()async{

    return await apiService.getPost();
  }

}