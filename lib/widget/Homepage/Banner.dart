import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/banner.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          left: 35,
          child: Container(
            width: 80,
            height: 20,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Edit',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
