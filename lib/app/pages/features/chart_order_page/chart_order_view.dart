import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_deep_clean_month.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_deep_clean_week.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_reg_clean_month.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/widget/chart_regular_clean_week.dart';

class ChartOrderView extends StatelessWidget {
  const ChartOrderView({super.key});

  Future<void> _refreshData() async {
    // Simulate a network request or data refresh
    await Future.delayed(Duration(seconds: 2));
    // Optionally, you can trigger the controller to fetch data again
    // For example:
    // Get.find<ChartOrderController>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final headingFontSize = screenWidth * 0.045;
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFFFFFF),
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
              fontSize: headingFontSize,
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Week'),
              Tab(text: 'Month'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  ChartRegularClean(),
                  const SizedBox(height: 50),
                  ChartDeepClean(),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    ChartRegCleanM(),
                    SizedBox(
                      height: 50,
                    ),
                    ChartDeepCleanM(),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
