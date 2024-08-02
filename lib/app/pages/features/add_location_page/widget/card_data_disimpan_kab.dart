import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardDataKab extends StatelessWidget {
  const CardDataKab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kabupaten',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              'Kota: ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              'Kudus',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              ', ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              'Pati',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
