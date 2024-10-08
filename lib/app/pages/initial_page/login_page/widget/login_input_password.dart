import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/login_controller.dart';

class InputPassword extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: loginController.passwordController,
            obscureText: loginController.isPasswordHidden.value,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: "Password",
              labelStyle: GoogleFonts.poppins(),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFF8A8A8A),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  loginController.isPasswordHidden.value
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Color(0xFF8A8A8A),
                ),
                onPressed: () {
                  loginController.isPasswordHidden.value =
                      !loginController.isPasswordHidden.value;
                },
              ),
              errorText: loginController.passwordError.value.isEmpty
                  ? null
                  : loginController.passwordError.value,
            ),
          ),
        ],
      ),
    );
  }
}
