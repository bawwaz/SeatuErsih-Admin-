import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardPembayaran extends StatelessWidget {
  final String totalPay;
  final String status;
  final DateTime orderDate;
  final String? profilePictureUrl;

  CardPembayaran({
    super.key,
    required this.totalPay,
    required this.status,
    required this.orderDate,
    this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (profilePictureUrl != null)
                  SvgPicture.network(
                    profilePictureUrl!,
                    height: 25,
                    width: 25,
                    placeholderBuilder: (BuildContext context) => CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  )
                else
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                SizedBox(width: 15),
                Text(
                  'Rp.${totalPay}',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1B9F61),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                'Total Pembayaran',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(
          color: Color(0xffF1F1F1),
          thickness: 2,
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Status',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.034,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[50],
              ),
              child: Text(
                '${status}',
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.029,
                  color: Color(0xFF176C45),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment Date',
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.034,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              DateFormat('dd MMMM yyyy').format(orderDate),
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.029,
                color: Color(0xff8A8A8A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
