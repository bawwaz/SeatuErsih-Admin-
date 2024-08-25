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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LogoProduct(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                    width: double.infinity, height: 53, child: InputName()),
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
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: SignIn(),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Pastikan sepatu pelanggan selalu bersih dan rapi.",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF8A8A8A),
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.029,
                        ),
                      ),
                      Text(
                        "Masuk sekarang untuk mulai mengelola pesanan!",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF8A8A8A),
                          fontWeight: FontWeight.w500,
                          fontSize: screenWidth * 0.029,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 33,
                // ),
                // SizedBox(
                //   width: double.infinity,
                //   height: 53,
                //   child: SignInGoogle(),
                // ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: Image.asset(
                          "assets/img/wash-icon.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 14),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //         width: 110,
                //         height: 110,
                //         child: Image.asset(
                //           "assets/img/clean-icon.png",
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
