import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDesc extends StatelessWidget {
  const InputDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 27, top: 10),
      child: SizedBox(
        width: 209,
        height: 55,
        child: TextField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "Example: Cuci 2 Gratis 1",
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