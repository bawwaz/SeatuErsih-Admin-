import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homePageController extends GetxController {
  var orders = [].obs;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async {
    try {
      final response = await http.get(Uri.parse('http://seatuersih.pradiptaahmad.tech/api/orders'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        orders.value = data['orders']; // Assumes the API returns a JSON object with an 'orders' field
      } else {
        Get.snackbar('Error', 'Failed to fetch orders');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
