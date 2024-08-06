import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleWidget extends StatelessWidget {
  final Map<DateTime, List<dynamic>> ordersByDate;

  ScheduleWidget({required this.ordersByDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: ordersByDate.keys.map((date) {
          return ExpansionTile(
            title: Text(
              date.toLocal().toString().split(' ')[0],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: ordersByDate[date]!
                .map((order) => ListTile(
                      title: Text(order['name']),
                      subtitle: Text(order['pickup_date']),
                    ))
                .toList(),
          );
        }).toList(),
      ),
    );
  }
}
