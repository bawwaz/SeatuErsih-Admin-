import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardDeclinedOrders extends StatelessWidget {
  final String orderType;
  final DateTime date;
  final String totalPrice;
  final String? decline_note;

  const CardDeclinedOrders({
    super.key,
    required this.decline_note,
    required this.orderType,
    required this.date,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/img/cleaning.png',
              width: 40,
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      orderType == 'deep_clean'
                          ? "Deep Clean"
                          : "Regular Clean",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.038,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'x1',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: screenWidth * 0.038,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  DateFormat('dd MMMM yyyy').format(date),
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.032,
                    color: Color(0xFF8A8A8A),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  totalPrice,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.032,
                    color: Color(0xff7EC1EB),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
