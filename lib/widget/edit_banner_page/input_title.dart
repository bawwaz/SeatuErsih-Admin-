import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, top: 10),
      child: SizedBox(
        width: 209,
        height: 34,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Special Promo",
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            contentPadding:
                EdgeInsets.only(bottom: 5, left: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}