import 'package:flutter/material.dart';

class InputNumberRegist extends StatelessWidget {
  const InputNumberRegist({
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
          labelText: "Input Number Regist",
          prefixIcon: Icon(
            Icons.pin,
            color: Color(0xFF8A8A8A),
          ),
        ),
      ),
    );
  }
}
