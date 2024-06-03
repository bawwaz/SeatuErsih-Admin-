import 'package:flutter/material.dart';

class InputPasswordRegist extends StatelessWidget {
  const InputPasswordRegist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "Password",
          prefixIcon: Icon(
            Icons.lock,
            color: Color(0xFF8A8A8A),
          ),
        ),
      ),
    );
  }
}
