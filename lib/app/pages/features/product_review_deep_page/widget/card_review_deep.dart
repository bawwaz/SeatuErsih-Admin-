import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardReviewDeep extends StatelessWidget {
  String name;
  DateTime date;
  final String? profilePictureUrl;
  String rating;
  String orderType;
  String review;

  CardReviewDeep({
    super.key,
    required this.name,
    required this.date,
    this.profilePictureUrl,
    required this.rating,
    required this.orderType,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: profilePictureUrl != null
                  ? NetworkImage(profilePictureUrl!)
                  : null,
              backgroundColor: Colors.grey.shade400,
              child: profilePictureUrl == null
                  ? Icon(
                      Icons.person,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${name}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.033,
                    color: Colors.black,
                  ),
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(date),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: screenWidth * 0.029,
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
                  '${rating}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.032,
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
          '${orderType}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: screenWidth * 0.033,
            color: Colors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${review}',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * 0.029,
                  color: Color(0xff8A8A8A),
                ),
              ),
            ),
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
