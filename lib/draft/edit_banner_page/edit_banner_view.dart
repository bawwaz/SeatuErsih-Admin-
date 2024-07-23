import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/draft/widget/edit_banner_page/add_image.dart';
import 'package:seatu_ersih_admin/draft/widget/edit_banner_page/input_desc.dart';
import 'package:seatu_ersih_admin/draft/widget/edit_banner_page/input_title.dart';
import 'package:seatu_ersih_admin/draft/widget/edit_banner_page/submit_button_edit.dart';

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
                            InputTitle(),
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
                            InputDesc(),
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
                            AddImage(),
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
            SubmitEdit(),
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
