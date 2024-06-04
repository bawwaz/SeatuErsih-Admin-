import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/login_page/login_controller.dart';

class InputPassword extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: loginController.passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Password",
        prefixIcon: Icon(
          Icons.lock,
          color: Color(0xFF8A8A8A),
        ),
      ),
    );
  }
}
