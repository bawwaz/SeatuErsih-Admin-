import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/api/users/service/login_auth_service.dart';
import 'package:seatu_ersih_admin/api/users/service/regist_auth_service.dart';
import 'package:seatu_ersih_admin/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  late RegistAuthService registAuthService;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    phoneController = TextEditingController();

    registAuthService = RegistAuthService();
    super.onInit();
  }

  Future<void> register() async {
    try {
      await registAuthService.regist(
        usernameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
      );

      Get.snackbar("Register Success", "Welcome!");
      Get.offAllNamed(Routes.homepage);
    } catch (e) {
      if (e.toString().contains("email already exists")) {
        Get.snackbar("Register Failed", "Email sudah tersedia");
      } else {
        Get.snackbar("Register Failed", e.toString());
      }
      print(e);
    }
  }
}
