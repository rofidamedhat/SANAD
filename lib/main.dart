import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sanad/core/routing/app_router.dart';
import 'package:sanad/firebase_options.dart';
import 'package:sanad/sanad_app.dart';
import 'package:sanad/core/services/notification_service.dart'; 
import 'core/constants.dart';
import 'core/di/dependency_injection.dart';
import 'core/helper/shared_pref_helper.dart';
import 'package:intl/date_symbol_data_local.dart'; 
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  await NotificationService.init(); 

  PermissionStatus alarmStatus = await Permission.scheduleExactAlarm.request();
if (alarmStatus.isDenied || alarmStatus.isPermanentlyDenied) {
  openAppSettings(); 
}

  await initializeDateFormatting('ar', null);

  setupGetIt();
  await isCheckedLogged();
  runApp(SanadApp(appRouter: AppRouter()));
}

Future<void> isCheckedLogged() async {
  String? token = await SharedPrefHelper.getString("token");
  print("token is $token");
  if (token == null || token.isEmpty) {
    isLoginUser = false; 
  } else {
    isVolunteerChecked();
    isLoginUser = true;
  }
}

Future<void> isVolunteerChecked() async {
  String? role = await SharedPrefHelper.getString("role");
  log("role is ===============================$role");
  if (role == "Volunteer") {
    isVolunteer = true;
  } else {
    isVolunteer = false;
  }
}