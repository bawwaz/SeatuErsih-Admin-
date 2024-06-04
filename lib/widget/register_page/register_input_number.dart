import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/view/register_page/register_controller.dart';

class InputNumberRegist extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: TextField(
        controller: registController.phoneController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Input Number Regist",
          prefixIcon: Icon(
            Icons.pin,
            color: Color(0xFF8A8A8A),
          ),
        ),
      ),
    );
  }
}
