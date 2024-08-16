import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/chart_order_controller.dart';

class ChartDeepClean extends StatelessWidget {
  final ChartOrderController chartOrderController =
      Get.find<ChartOrderController>();

  ChartDeepClean({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (chartOrderController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      DateTime now = DateTime.now();
      DateTime sevenDaysAgo = now.subtract(Duration(days: 6));

      List<dynamic> filteredData = chartOrderController.chartReg.where((data) {
        DateTime date = DateTime.parse(data['date']);
        return date.isAfter(sevenDaysAgo) &&
            date.isBefore(now.add(Duration(days: 1)));
      }).toList();

      List<FlSpot> spots = filteredData.asMap().entries.map((entry) {
        int index = entry.key;
        var data = entry.value;
        double total = double.parse(data['total'].toString());
        return FlSpot(index.toDouble(), total);
      }).toList();

      // Handle cases where all data points might be zero
      double maxY = spots.isNotEmpty && spots.any((spot) => spot.y > 0)
          ? spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) + 1
          : 1;

      double maxX = spots.isNotEmpty ? spots.length.toDouble() - 1 : 1;

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(top: 36.0, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Deep Clean Recap',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Data dari 7 hari yang lalu',
              style: GoogleFonts.poppins(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.8,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      barWidth: 2,
                      color: Color(0xFF7EC1EB),
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Color(0xFF7EC1EB).withOpacity(0.2),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: maxX,
                  minY: 0,
                  maxY: maxY,
                  titlesData: FlTitlesData(
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          int index = value.toInt();
                          if (index >= 0 && index < filteredData.length) {
                            DateTime date =
                                DateTime.parse(filteredData[index]['date']);
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  DateFormat('E').format(date),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF7EC1EB),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toString(),
                            style: TextStyle(
                              color: Color(0xFF7EC1EB),
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  gridData: FlGridData(
                    show: false,
                    drawVerticalLine: false,
                    horizontalInterval: 1.0,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.white.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
