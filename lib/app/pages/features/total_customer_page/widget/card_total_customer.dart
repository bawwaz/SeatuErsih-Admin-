import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardTotalCustomer extends StatelessWidget {
  final String name;
  final DateTime joinDate;
  final String? profilePictureUrl;
  final String? totalCustomer;
  final int totalRegularClean;
  final int totalDeepClean;
  final String email;
  final String phone;

  CardTotalCustomer({
    super.key,
    required this.name,
    required this.joinDate,
    this.profilePictureUrl,
    this.totalCustomer,
    required this.totalRegularClean,
    required this.totalDeepClean,
    required this.email,
    required this.phone,
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
              radius: screenWidth * 0.05,
              backgroundImage: profilePictureUrl != null
                  ? NetworkImage(profilePictureUrl!)
                  : null,
              backgroundColor: Colors.grey.shade400,
              child: profilePictureUrl == null
                  ? Icon(
                      Icons.person,
                      color: Colors.white,
                      size: screenWidth * 0.05,
                    )
                  : null,
            ),
            SizedBox(width: screenWidth * 0.03),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: screenWidth * 0.033,
              ),
            ),
          ],
        ),
        SizedBox(height: screenWidth * 0.01),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: screenWidth * 0.01),
        Text(
          'Email: ${email}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: screenWidth * 0.030,
          ),
        ),
        SizedBox(height: screenWidth * 0.010),
        Text(
          'Telepon: ${phone}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: screenWidth * 0.030,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: screenWidth * 0.01),
        Text(
          'Bergabung pada:',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: screenWidth * 0.032,
          ),
        ),
        SizedBox(height: screenWidth * 0.015),
        Text(
          DateFormat('dd MMMM yyyy').format(joinDate),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: screenWidth * 0.032,
          ),
        ),
        SizedBox(height: screenWidth * 0.01),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: screenWidth * 0.01),
        Text(
          'Total Order Regular Clean: ${totalRegularClean}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: screenWidth * 0.030,
          ),
        ),
        SizedBox(height: screenWidth * 0.010),
        Text(
          'Total Order Deep Clean: ${totalDeepClean}',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: screenWidth * 0.030,
          ),
        ),
      ],
    );
  }
}
