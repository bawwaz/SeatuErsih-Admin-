import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardProductReviewRegular extends StatelessWidget {
  final String name;
  final String description;
  final String rating;

  const CardProductReviewRegular({
    super.key,
    required this.name,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${name}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${description}',
          style: GoogleFonts.poppins(
              fontSize: 12,
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
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Text(
                  '${rating}',
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
            Spacer(),
            Image.asset(
              'assets/img/cleaning.png',
              height: 40,
            ),
          ],
        ),
      ],
    );
  }
}
