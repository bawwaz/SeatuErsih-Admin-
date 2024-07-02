import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDeclined extends StatelessWidget {
  const CardDeclined({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Declined Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xffE75060),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '5',
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}