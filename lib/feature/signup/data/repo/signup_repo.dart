import 'package:sanad/feature/signup/data/model/signup_request_body.dart';
import 'package:sanad/feature/signup/data/model/signup_response_body.dart';

import '../../../../core/networking/api_service.dart';

class SignupRepo{

  final ApiService apiService;
  SignupRepo(this.apiService);

  Future<SignupResponseBody>signup(SignupRequestBody signupRequestBody)async{

    return await apiService.signup(signupRequestBody);
  }
}