import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/register_controller.dart';

class InputPasswordRegist extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: TextField(
        controller: registController.passwordController,
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
      ),
    );
  }
}
