import 'package:sanad/core/networking/api_service.dart';
import 'package:sanad/feature/login/data/model/login_request_body.dart';
import 'package:sanad/feature/login/data/model/login_response_body.dart';

class LoginRepo {

  final ApiService apiService;
  LoginRepo(this.apiService);

Future<LoginResponseBody>login(LoginRequestBody loginRequestBody)async{

  return await apiService.login(loginRequestBody);
}
}
