import 'package:flutter/material.dart';

class InputNameRegist extends StatelessWidget {
  const InputNameRegist({
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
          labelText: "Name",
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xFF8A8A8A),
          ),
          labelStyle: TextStyle(),
        ),
        style: TextStyle(),
      ),
    );
  }
}
