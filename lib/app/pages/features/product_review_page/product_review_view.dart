import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_deep.dart';
import 'package:seatu_ersih_admin/app/pages/features/product_review_page/widget/card_product_review_regular.dart';
import 'package:seatu_ersih_admin/app/router/app_pages.dart';

class ProductReviewView extends StatelessWidget {
  const ProductReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: () {},
        //   child: Image.asset('assets/img/angle-circle-right 1.png'),
        // ),
        centerTitle: true,
        title: Text(
          'Product Review',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PRODUCTREVIEWREG);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: CardProductReviewRegular(),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.PRODUCTREVIEWDEEP);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 0),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: CardProductReviewDeep(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
