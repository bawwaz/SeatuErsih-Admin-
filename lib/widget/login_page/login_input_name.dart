import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:seatu_ersih_admin/view/login_page/login_controller.dart';

class InputName extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: loginController.emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Email",
        prefixIcon: Icon(
          Icons.person,
          color: Color(0xFF8A8A8A),
        ),
        
      ),
    );
  }
}
