import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCompleted extends StatelessWidget {
  const CardCompleted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Completed Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff3AC430),
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