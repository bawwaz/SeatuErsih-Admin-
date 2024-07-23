import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/api/users/service/login_auth_service.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late LoginAuthService loginAuthService;
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    loginAuthService = LoginAuthService();
    super.onInit();
  }

  Future<void> login() async {
    try {
      final response = await loginAuthService.login(
          emailController.text, passwordController.text);
      print(response.data['token'].toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('token', response.data['token']);
      Get.snackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.HOME);
    } catch (e) {
      print(e);
    }
  }
}
