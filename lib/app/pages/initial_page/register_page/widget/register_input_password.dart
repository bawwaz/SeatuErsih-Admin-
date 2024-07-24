import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/register_page/register_controller.dart';

class InputPasswordRegist extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: 53,
        child: TextField(
          controller: registController.passwordController,
          obscureText: registController.isPasswordHidden.value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: "Password",
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFF8A8A8A),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                registController.isPasswordHidden.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Color(0xFF8A8A8A),
              ),
              onPressed: () {
                registController.isPasswordHidden.value =
                    !registController.isPasswordHidden.value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
