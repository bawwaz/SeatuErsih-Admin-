import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/view/register_page/register_controller.dart';

class ButtonCreateAccount extends StatelessWidget {
  final RegisterController registController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: () {
            registController.register();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7EC1EB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Text(
            "Create account",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
