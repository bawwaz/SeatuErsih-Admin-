import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAccept extends StatelessWidget {
  const ButtonAccept({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Color(0xff7EC1EB),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          'Accept',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}