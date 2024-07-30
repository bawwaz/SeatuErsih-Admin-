import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardReviewDeep extends StatelessWidget {
  const CardReviewDeep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,
              child: ClipOval(
                child: Image.asset(
                  'assets/img/profile-icon.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bawwaz',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '4 Okt 2024',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff8A8A8A),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xffFBBC05), size: 25),
                SizedBox(width: 4),
                Text(
                  '4.5',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text(
          'Regular Clean x2',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                'Saya nga pernah liat spatu saya sebersih ini',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff8A8A8A),
                ),
              ),
            ),
            SizedBox(width: 8),
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