import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardOrder extends StatelessWidget {
  final String product;
  final String note;
  final DateTime date;

  CardOrder({
    super.key,
    required this.product,
    required this.note,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;

    // Set responsive font sizes and padding
    final titleFontSize = screenWidth * 0.04; // 4% of screen width
    final contentFontSize = screenWidth * 0.035; // 3.5% of screen width
    final dividerHeight = screenWidth * 0.03; // 3% of screen width
    final verticalSpacing = screenWidth * 0.015; // 1.5% of screen width

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          product == 'regular_clean' ? 'Regular Clean' : 'Deep Clean',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(
          color: Color(0xffF1F1F1),
          height: dividerHeight,
          thickness: 1,
        ),
        Text(
          'Tanggal',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          DateFormat('dd MMMM yyyy').format(date),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(
          color: Color(0xffF1F1F1),
          height: dividerHeight,
          thickness: 1,
        ),
        Text(
          'Note',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          note,
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
