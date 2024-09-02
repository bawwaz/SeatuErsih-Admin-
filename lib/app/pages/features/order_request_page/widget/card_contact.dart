import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContact extends StatelessWidget {
  String address;
  final String kabName;
  final String kecName;
  // String phone;
  CardContact({
    super.key,
    required this.address,
    required this.kabName,
    required this.kecName,
    // required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final titleFontSize = screenWidth * 0.04; // 4% of screen width
    final contentFontSize = screenWidth * 0.035; // 3.5% of screen width
    final dividerHeight = screenWidth * 0.03; // 3% of screen width
    final verticalSpacing = screenWidth * 0.015; // 1.5% of screen width

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
        SizedBox(height: 4),
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
        // Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        // Text(
        //   'Nomor Telepon',
        //   style: GoogleFonts.poppins(
        //     fontWeight: FontWeight.w600,
        //     color: Colors.black,
        //     fontSize: screenWidth * 0.038,
        //   ),
        // ),
        // SizedBox(height: 4),
        // Text(
        //   '${phone}',
        //   style: GoogleFonts.poppins(
        //     fontWeight: FontWeight.w400,
        //     color: Color(0xff8A8A8A),
        //     fontSize: screenWidth * 0.032,
        //   ),
        // ),
      ],
    );
  }
}
