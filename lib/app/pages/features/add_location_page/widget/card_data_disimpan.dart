import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDataDisimpan extends StatelessWidget {
  const CardDataDisimpan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kabupaten Kudus',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        Text(
          'Kecamatan: Gebog,',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}