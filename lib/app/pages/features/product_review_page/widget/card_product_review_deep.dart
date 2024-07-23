import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CardProductReviewDeep extends StatelessWidget {
  const CardProductReviewDeep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Deep Clean',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Proses pembersihan standar untuk sepatu yang meliputi beberapa langkah dasar untuk menghilangkan kotoran, noda, dan bau yang menempel pada sepatu.',
          style: GoogleFonts.poppins(
              fontSize: 14,
              color: Color(0xff8A8A8A),
              fontWeight: FontWeight.w500),
        ),
        Divider(
          height: 24,
          thickness: 1,
          color: Color(0xff8A8A8A),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Avg Rating :',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Text(
                  '4.5',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.star,
                  color: Color(0xFFFBBC05),
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}