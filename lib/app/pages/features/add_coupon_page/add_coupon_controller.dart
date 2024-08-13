import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCouponController extends GetxController {
  var selectedDate = ''.obs;

  void updateSelectedDate(String date) {
    selectedDate.value = date;
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      updateSelectedDate("${picked.toLocal()}".split(' ')[0]);
    }
  }
}
