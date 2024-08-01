import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 160,
          height: 50,
          child: FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {},
            backgroundColor: Color(0xff7EC1EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            label: Text(
              'Accept',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Container(
          width: 160,
          height: 50,
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: Color(0xffEB4335),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            label: Text(
              'Decline',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
