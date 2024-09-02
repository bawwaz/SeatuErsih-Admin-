import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetail extends StatelessWidget {
  final String orderType;
  final String desc;
  final String paymethod;

  CardDetail({
    super.key,
    required this.desc,
    required this.paymethod,
    required this.orderType,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final verticalSpacing = screenWidth * 0.015;
    final dividerHeight = screenWidth * 0.04;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Type',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.034,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          orderType == 'regular_clean' ? 'Regular Clean' : 'Deep Clean',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.030,
          ),
        ),
        Divider(
          color: Color(0xffF1F1F1),
          height: dividerHeight,
          thickness: 1,
        ),
        Text(
          'Deskripsi',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.034,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          '${desc}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.030,
          ),
        ),
        Divider(
          color: Color(0xffF1F1F1),
          height: dividerHeight,
          thickness: 1,
        ),
        Text(
          'Pembayaran',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.034,
          ),
        ),
        SizedBox(height: verticalSpacing),
        Text(
          '${paymethod}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.030,
          ),
        ),
      ],
    );
  }
}
