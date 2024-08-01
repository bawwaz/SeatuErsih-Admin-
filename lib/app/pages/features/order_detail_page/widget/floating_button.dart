import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButtonDetail extends StatelessWidget {
  const FloatingButtonDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 300,
          height: 50,
          child: FloatingActionButton.extended(
            heroTag: null,
            onPressed: () {},
            backgroundColor: Color(0xff7EC1EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            label: Text(
              'Complete',
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
