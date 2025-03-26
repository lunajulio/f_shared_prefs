import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'pages/authentication/login_page.dart';
import 'pages/home/content.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthController authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Authentication Flow',
        themeMode: ThemeMode.system,
        home: GetX<AuthController>(
          builder: (controller) {
            if (controller.logged) {
              return const Content();
            }
            return const LoginPage();
          },
        ));
  }
}
