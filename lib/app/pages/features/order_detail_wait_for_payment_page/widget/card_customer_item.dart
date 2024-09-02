import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustomerItemWait extends StatelessWidget {
  String brand;
  String addons;
  String notes;
  CardCustomerItemWait({
    super.key,
    required this.brand,
    required this.addons,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Brand Sepatu',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${brand}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        Text(
          'AddOns',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${addons}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        Text(
          'Note',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${notes}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
      ],
    );
  }
}
