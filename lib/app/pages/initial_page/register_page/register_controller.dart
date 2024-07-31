import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/api/users/service/regist_auth_service.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;

  var isPasswordHidden = true.obs;
  var isLoading = false.obs; // Add this line to manage loading state

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
    isLoading.value = true; 
    try {
      await registAuthService.regist(
        usernameController.text,
        emailController.text,
        phoneController.text,
        passwordController.text,
      );

      Get.snackbar("Register Success", "Welcome!");
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      if (e.toString().contains("email already exists")) {
        Get.snackbar("Register Failed", "Email sudah tersedia");
      } else {
        Get.snackbar("Register Failed", e.toString());
      }
      print(e);
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }
}
