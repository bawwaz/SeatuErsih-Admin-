import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SubmitEdit extends StatelessWidget {
  const SubmitEdit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Center(
        child: InkWell(
          onTap: () {
            print("1234");
          },
          child: Container(
            width: 210,
            height: 29,
            decoration: BoxDecoration(
              color: Color(0xFF7EC1EB),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "Edit",
                style: GoogleFonts.poppins(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}