import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCustomer extends StatelessWidget {
  String username;
  String email;
  String phone;
  String profile;

  CardCustomer({
    super.key,
    required this.username,
    required this.email,
    required this.phone,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage:
                  profile.isNotEmpty ? NetworkImage(profile) : null,
              backgroundColor: Colors.grey.shade400,
              child: profile.isEmpty
                  ? Icon(
                      Icons.person,
                      color: Colors.white,
                    )
                  : null,
            ),
            SizedBox(width: 10),
            Text(
              username,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: screenWidth * 0.038,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: 2),
        Text(
          'Email',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 2),
        Text(
          email,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: 2),
        Text(
          'No.Telepon',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: screenWidth * 0.038,
          ),
        ),
        SizedBox(height: 2),
        Text(
          phone,
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
