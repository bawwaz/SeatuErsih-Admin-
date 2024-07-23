import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContact extends StatelessWidget {
  const CardContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alamat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Jl.Besito, Jawa Tengah Kodepos 53356',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: 13,
          ),
        ),
        Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        Text(
          'Nomor Telepon',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '0821231113218',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}