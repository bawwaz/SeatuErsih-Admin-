import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardOrderDetail extends StatelessWidget {
  String product;
  String note;
  DateTime date;

  CardOrderDetail({
    super.key,
    required this.product,
    required this.note,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
        SizedBox(height: 4),
        Text(
          product == 'regular_clean' ? 'Regular Clean' : 'Deep Clean',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(color: Color(0xffF1F1F1), height: 20, thickness: 1),
        Text(
          'Tanggal',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${DateFormat('dd MMMM yyyy').format(date)}',
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
          '${note}',
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
