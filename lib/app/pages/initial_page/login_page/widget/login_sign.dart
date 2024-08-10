import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/initial_page/login_page/login_controller.dart';

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
          backgroundColor:
              loginController.isLoading.value ? Colors.grey : Color(0xFF7EC1EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: loginController.isLoading.value
            ? LoadingDots()
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

class LoadingDots extends StatefulWidget {
  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<int>? _dotAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
    _dotAnimation = IntTween(begin: 0, end: 3).animate(_controller!);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _dotAnimation!,
      builder: (context, child) {
        String dots = '.' * (_dotAnimation!.value + 1);
        return Text(
          'Loading$dots',
          style: GoogleFonts.poppins(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
