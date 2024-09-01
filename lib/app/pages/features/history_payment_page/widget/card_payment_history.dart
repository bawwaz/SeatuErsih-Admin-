import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class PaymentHistory extends StatelessWidget {
  String paymentChannel;
  final DateTime orderDate;
  String desc;
  String price;
  final String? profilePictureUrl;

  PaymentHistory({
    super.key,
    required this.paymentChannel,
    required this.orderDate,
    required this.desc,
    required this.price,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 50),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${paymentChannel}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        DateFormat('• dd MMMM yyyy').format(orderDate),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8A8A8A),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${desc}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8A8A8A),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '+ Rp.${price}',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.green,
                fontSize: 13,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Divider(thickness: 1, color: Colors.black12),
        SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
