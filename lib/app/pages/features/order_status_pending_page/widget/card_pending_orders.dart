import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CardPendingOrders extends StatelessWidget {
  String orderType;
  DateTime date;
  String totalPrice;
  CardPendingOrders({
    super.key,
    required this.orderType,
    required this.date,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 85,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
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
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${DateFormat('dd MMMM yyyy').format(date)}',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.032,
                      color: Color(0xFF8A8A8A),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${totalPrice}',
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Icon(Icons.arrow_forward_ios)],
          ),
        ],
      ),
    );
  }
}
