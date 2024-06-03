import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/widget/edit_card_page/input_name.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_create_account.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_icon.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_input_email.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_input_number.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_input_password.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_input_username.dart';
import 'package:seatu_ersih_admin/widget/register_page/register_sign_up_google.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconApp(),
              SizedBox(height: 29),
              Row(
                children: [
                  Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              InputNameRegist(),
              SizedBox(
                height: 20,
              ),
              InputEmailRegist(),
              SizedBox(
                height: 20,
              ),
              InputPasswordRegist(),
              SizedBox(
                height: 20,
              ),
              InputNumberRegist(),
              SizedBox(
                height: 30,
              ),
              ButtonCreateAccount(),
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
              SizedBox(height: 33),
              SizedBox(
                width: double.infinity,
                height: 53,
                child: SignUpGoogle(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF1F1F1F),
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF7EC1EB),
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
