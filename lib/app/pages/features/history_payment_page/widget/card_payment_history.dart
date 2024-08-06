import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentHistory extends StatelessWidget {
  const PaymentHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 50),
            SizedBox(
                width: 29,
                height: 29,
                child: Image.asset(
                  "assets/img/gopay-icon.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'GOPAY',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '• 05 Juli 2024',
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
                    'Regular Clean',
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
              '- IDR 25.000',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Color(0xffFF6363),
                fontSize: 13,
              ),
            ),
          ],
        ),
        Divider(thickness: 1, color: Colors.black12),
      ],
    );
  }
}