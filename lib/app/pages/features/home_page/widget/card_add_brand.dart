import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAddBrand extends StatelessWidget {
  const CardAddBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tambah Brand Sepatu',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Image.asset("assets/img/shoe-print.png")
          ],
        ),
      ],
    );
  }
}
