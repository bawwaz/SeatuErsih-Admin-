import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih_admin/api/users/service/login_auth_service.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var box = GetStorage();

  late LoginAuthService loginAuthService;

  @override
  void onInit() {
    emailController.text = "admin@gmail.com";
    passwordController.text = "admin12345";

    loginAuthService = LoginAuthService();
    super.onInit();
  }

  bool validateInputs() {
    bool isValid = true;

    if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = "Email tidak boleh kosong";
      isValid = false;
    } else {
      emailError.value = '';
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = "Password tidak boleh kosong";
      isValid = false;
    } else {
      passwordError.value = '';
    }

    return isValid;
  }

  Future<void> login() async {
    if (!validateInputs()) return;

    isLoading.value = true;
    try {
      var notificationToken = GetStorage().read('tokenFirebase');
      final response = await loginAuthService.login(
        emailController.text,
        passwordController.text,
        notificationToken,
      );

      box.write('token', response.data['token']);
      box.write('username', response.data['user']['username']);

      showCustomSnackbar("Login Success", "Welcome Back!");
      Get.offAllNamed(Routes.BTMNAVBAR);
    } catch (e) {
      emailError.value = '';
      passwordError.value = '';

      if (e.toString().contains("Invalid password")) {
        passwordError.value = "Password Anda salah";
        showCustomSnackbar("Login Failed", "Password Anda salah", isError: true);
      } else if (e.toString().contains("Invalid email")) {
        emailError.value = "Email Anda salah";
        showCustomSnackbar("Login Failed", "Email Anda salah", isError: true);
      } else {
        emailError.value = "Email atau password Anda salah";
        passwordError.value = "Email atau password Anda salah";
        showCustomSnackbar("Login Failed", "Email atau password Anda salah", isError: true);
      }

      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void showCustomSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Color(0xffff3333) : Color(0xff17B169),
      colorText: Colors.white,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 800),
      duration: Duration(seconds: 3),
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      barBlur: 20,
      overlayBlur: 0.3,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}
