import 'package:flutter/material.dart';

class InputEmailRegist extends StatelessWidget {
  const InputEmailRegist({
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
          labelText: "Email",
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xFF8A8A8A),
          ),
          labelStyle: TextStyle(),
        ),
        style: TextStyle(),
      ),
    );
  }
}
