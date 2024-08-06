import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardTotalCustomer extends StatelessWidget {
  final String name;
  final DateTime joinDate;
  final String? profilePictureUrl;
  final String? totalCustomer;

  CardTotalCustomer({
    super.key,
    required this.name,
    required this.joinDate,
    this.profilePictureUrl,
    this.totalCustomer,
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
            SizedBox(width: 10),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Divider(color: Colors.grey.shade300, thickness: 1),
        SizedBox(height: 2),
        Text(
          'Bergabung pada:',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 2),
        Text(
          DateFormat('dd MMMM yyyy').format(joinDate),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Color(0xff8A8A8A),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
