import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/register_page/register_controller.dart';

class InputEmailRegist extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: TextField(
        controller: registController.emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Email",
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xFF8A8A8A),
          ),
          labelStyle: TextStyle(),
        ),
        style: TextStyle(),
      ),
    );
  }
}
