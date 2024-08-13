import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TextFieldDescCoupon extends StatelessWidget {
  const TextFieldDescCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Tambahkan deskripsi..',
        hintStyle: GoogleFonts.poppins(
          color: Color(0xff8a8a8a),
          fontSize: 14,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
      ),
    );
  }
}