import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_deep_clean.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_regular_clean.dart';

class ChartOrderView extends StatelessWidget {
  const ChartOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset('assets/img/angle-circle-right 1.png'),
        ),
        centerTitle: true,
        title: Text(
          'Chart Order Customers',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // <-- Menambahkan ini
          children: [
            ChartRegularClean(), // Adding the chart widget here
            SizedBox(height: 20),
            ChartDeepClean(),
          ],
        ),
      ),
    );
  }
}
