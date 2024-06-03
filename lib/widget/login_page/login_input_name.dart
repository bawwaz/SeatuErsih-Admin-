import 'package:flutter/material.dart';

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "Name",
        prefixIcon: Icon(
          Icons.person,
          color: Color(0xFF8A8A8A),
        ),
      ),
    );
  }
}
