import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/register_controller.dart';

class InputNameRegist extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: TextField(
        controller: registController.usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Name",
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xFF8A8A8A),
          ),
          labelStyle: TextStyle(),
        ),
        style: TextStyle(),
      ),
    );
  }
}
