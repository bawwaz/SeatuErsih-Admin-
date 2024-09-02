import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:seatu_ersih_admin/app/pages/features/chart_order_page/chart_order_controller.dart';

class ChartRegularClean extends StatelessWidget {
  final ChartOrderController chartOrderController =
      Get.find<ChartOrderController>();

  ChartRegularClean({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (chartOrderController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      DateTime now = DateTime.now();
      DateTime sevenDaysAgo = now.subtract(Duration(days: 6));

      // Group data by date and sum totals
      Map<String, double> groupedData = {};
      for (var data in chartOrderController.chartReg) {
        DateTime date = DateTime.parse(data['date']);
        if (date.isAfter(sevenDaysAgo) && date.isBefore(now.add(Duration(days: 1)))) {
          String day = DateFormat('E').format(date);  // e.g., "Mon", "Tue"
          double total = double.parse(data['total'].toString());
          groupedData.update(day, (value) => value + total, ifAbsent: () => total);
        }
      }

      // Create spots based on unique days
      List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      List<FlSpot> spots = [];
      for (int i = 0; i < daysOfWeek.length; i++) {
        if (groupedData.containsKey(daysOfWeek[i])) {
          spots.add(FlSpot(i.toDouble(), groupedData[daysOfWeek[i]]!));
        } else {
          spots.add(FlSpot(i.toDouble(), 0.0));
        }
      }

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
              'Regular Clean Recap',
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
                  maxX: 6,  // 7 days in a week
                  minY: 0,
                  maxY: spots
                          .map((spot) => spot.y)
                          .reduce((a, b) => a > b ? a : b) +
                      1,
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
                          if (index >= 0 && index < daysOfWeek.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  daysOfWeek[index],
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
