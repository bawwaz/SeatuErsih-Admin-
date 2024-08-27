import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/chart_order_controller.dart';

class ChartRegCleanM extends StatelessWidget {
  final ChartOrderController chartOrderController =
      Get.find<ChartOrderController>();

  ChartRegCleanM({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (chartOrderController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      // Filter out days with 0 totals
      List<dynamic> filteredMonthData =
          chartOrderController.chartReg.where((data) {
        return double.parse(data['total'].toString()) > 0;
      }).toList();

      // Ensure maxY is assigned a value before being used
      double maxY = 1; // Initialize maxY with a default value
      double highestTotal = 0;
      String bestSellingDay = '';

      List<BarChartGroupData> barGroups =
          filteredMonthData.asMap().entries.map((entry) {
        int index = entry.key;
        var data = entry.value;
        double total = double.parse(data['total'].toString());

        // Update maxY with the maximum value found
        if (total > maxY) {
          maxY = total + 10; // Add a little padding
        }

        // Find the highest total and corresponding date
        if (total > highestTotal) {
          highestTotal = total;
          DateTime date = DateTime.parse(data['date']);
          bestSellingDay = DateFormat('d MMMM').format(date);
        }

        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: total,
              width: 16,
              color: const Color(0xFF7EC1EB),
              borderRadius: BorderRadius.circular(4),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: maxY,
                color: const Color(0xFF7EC1EB).withOpacity(0.4),
              ),
            ),
          ],
        );
      }).toList();

      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(blurRadius: 1, color: Colors.black.withOpacity(0.2)),
            ]),
        padding: const EdgeInsets.only(top: 36.0, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Regular Clean Recap',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Data dari satu bulan',
              style: GoogleFonts.poppins(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
              child: BarChart(
                BarChartData(
                  barGroups: barGroups,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < filteredMonthData.length) {
                            DateTime date = DateTime.parse(
                                filteredMonthData[index]['date']);
                            return Text(
                              DateFormat('MMM d').format(date),
                              style: TextStyle(
                                color: Color(0xFF7EC1EB),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.1),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.toY}',
                          TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            if (bestSellingDay.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'On $bestSellingDay, Regular Clean was the best selling,',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            Text(
              'with a total of $highestTotal orders!',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    });
  }
}
