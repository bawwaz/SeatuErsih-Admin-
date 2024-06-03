import 'package:flutter/material.dart';

class IconApp extends StatelessWidget {
  const IconApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Image.asset("assets/img/icon-app.png"),
      )),
    );
  }
}

