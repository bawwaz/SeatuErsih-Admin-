import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardInProgress extends StatelessWidget {
  const CardInProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'In-progress Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff7EC1EB),
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