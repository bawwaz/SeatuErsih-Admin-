import 'package:flutter/material.dart';

class LogoProduct extends StatelessWidget {
  const LogoProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Image.asset(
        "assets/img/icon-app.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
