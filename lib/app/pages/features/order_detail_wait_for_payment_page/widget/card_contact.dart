import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContactWait extends StatelessWidget {
  final String kabName;
  final String kecName;
  final String address;

  CardContactWait({
    super.key,
    required this.kabName,
    required this.kecName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dividerHeight = screenWidth * 0.03;
    final verticalSpacing = screenWidth * 0.015;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alamat',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Row(
          children: [
            Text(
              kecName,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
            Text(
              ', ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
            Text(
              kabName,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
            Text(
              ', ',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
            Text(
              address,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Color(0xff8A8A8A),
                fontSize: screenWidth * 0.032,
              ),
            ),
          ],
        ),
        Divider(
          color: Color(0xffF1F1F1),
          height: dividerHeight,
          thickness: 1,
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Status',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: screenWidth * 0.038,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[50],
              ),
              child: Text(
                'Belum bayar',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.029,
                  color: Color(0xFF922F28),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
