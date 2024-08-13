import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButtonAddCoupon extends StatelessWidget {
  const FloatingButtonAddCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
      },
      backgroundColor: Color(0xff7EC1EB),
      child: Text(
        'Simpan',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
