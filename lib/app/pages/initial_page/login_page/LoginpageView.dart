import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_Icon.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_forget_password.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_input_name.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_input_password.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_sign.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/widget/login_sign_google.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: LogoProduct(),
              ),
              SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  Text(
                    "Login Admin ",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.055,
                    ),
                  ),
                  Text(
                    "SEATUERSIH",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF7EC1EB),
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.055,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(width: double.infinity, height: 53, child: InputName()),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity, height: 53, child: InputPassword()),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ForgetPassword(),
              // ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: SignIn(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 99,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "or continue with",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 99,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 33,
              ),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: SignInGoogle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
