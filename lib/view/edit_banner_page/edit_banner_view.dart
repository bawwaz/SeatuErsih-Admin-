import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBannerView extends StatelessWidget {
  const EditBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(27),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset("assets/img/angle-circle-right 1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: 259,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20, left: 27),
                              child: Text(
                                "Title",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 27),
                              child: Text(
                                "Description",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 27),
                              child: Text(
                                "Add Photo",
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF7EC1EB),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 27.0, top: 10),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 111,
                                  width: 210,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 0.5,
                                          spreadRadius: 0.5,
                                        )
                                      ]),
                                  child:
                                      Image.asset("assets/img/picture 1.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      child: Text(
                        "Edit Banner",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Center(
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
            SizedBox(
              height: 45,
            ),
            Image.asset("assets/img/wash-icon.png")
          ],
        ),
      ),
    );
  }
}
