import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDataDisimpanAddBrand extends StatelessWidget {
  const CardDataDisimpanAddBrand({
    super.key,
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
        Row(
          children: [
            Text(
              'Nama Sepatu: ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              'Nike Air Force 1,',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Text(
              ' Converse 70',
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
