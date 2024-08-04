import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDataDisimpanAddBrand extends StatelessWidget {
  final String brands;

  const CardDataDisimpanAddBrand({
    super.key,
    required this.brands,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sepatu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Nama Sepatu: $brands',
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
