import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingButtonAddBrand extends StatelessWidget {
  const FloatingButtonAddBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text(
          'Simpan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        backgroundColor: Color(0xff7EC1EB),
      ),
    );
  }
}