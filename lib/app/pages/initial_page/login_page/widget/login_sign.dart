import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/login_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignIn extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ElevatedButton(
        onPressed: loginController.isLoading.value
            ? null
            : () {
                loginController.login();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF7EC1EB),
          disabledBackgroundColor: Color(0xFF7EC1EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: loginController.isLoading.value
            ? LoadingAnimationWidget.horizontalRotatingDots(
                color: Colors.white,
                size: 30,
              )
            : Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      );
    });
  }
}
