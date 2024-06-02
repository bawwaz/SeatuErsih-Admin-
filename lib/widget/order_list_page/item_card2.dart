import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard2 extends StatelessWidget {
  const ItemCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Card(
              elevation: 4,
              color: Colors.white,
              child: Container(
                width: 80,
                height: 80,
                child: Image.asset(
                  'assets/img/shoes-icon2.png',
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'Regular Clean',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.info_outline,
                    color: Color(0xFF7EC1EB),
                  ),
                ],
              ),
              Text(
                'x2',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
              ),
              Text(
                '50.000',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7EC1EB),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}