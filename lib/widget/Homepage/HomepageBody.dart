import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/widget/Homepage/Banner.dart';
import 'package:seatu_ersih_admin/widget/Homepage/ProductsContainer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Color(0xFF7EC1EB),
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sepatu Resik',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'dadine Apik!',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 19.5),
              child: BannerCard(),
            ),
          ),
        ]),
        SizedBox(
          height: 30,
        ),
        Center(child: Products())
      ],
    );
  }
}
