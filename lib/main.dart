import 'package:flutter/material.dart';
import 'package:sanad/sanad_app.dart';

import 'core/constants.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  isCheckedLogged();
  runApp(SanadApp());
}
Future<void> isCheckedLogged()async{
  String? token=await SharedPrefHelper.getString("token");
  if(token == null || token.isEmpty){
    isLoginUser= false;
  }
  else{
    isLoginUser=true;
  }
}