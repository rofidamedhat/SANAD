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
  print("token is $token");
  if(token == null || token.isEmpty){
    isLoginUser= false;
  }
  else{
    isVolunteerChecked();
    isLoginUser=true;
  }
}

Future<void>isVolunteerChecked()async{
  String? role=await SharedPrefHelper.getString("role");
  print("role is $role");
  if(role=="Volunteer"){
    isVolunteer=true;
  }
  else{
    isVolunteer=false;
  }
}
