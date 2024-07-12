import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonDecline extends StatelessWidget {
  const ButtonDecline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Color(0xffEB4335),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          'Decline',
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