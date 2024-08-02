import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardManageLocation extends StatelessWidget {
  const CardManageLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Atur Jangkauan Lokasi ',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Image.asset("assets/img/map-pin.png")
          ],
        ),
      ],
    );
  }
}
