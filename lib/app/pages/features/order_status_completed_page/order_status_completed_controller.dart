import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class OrderStatusCompletedController extends GetxController {
  var completedOrder = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getCompletedOrder();
    getCompletedOrderFiltered();
  }

  Future<void> getCompletedOrderFiltered() async {
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;
    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }
      isLoading.value = true;

      var response = await http.get(
        Uri.parse('$url/order/count/completed'),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          completedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          completedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCompletedOrder() async {
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
        return;
      }

      isLoading.value = true;

      var response = await http.get(
        Uri.parse('$url/order/status/completed'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          completedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          completedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          Get.snackbar('Error', 'Unexpected response format');
        }
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Map<String, String> get headers {
    print('Retrieved Token: ${token.value}');
    return {
      "Accept": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Content-Type": "application/json"
    };
  }

  // Filter completed orders for today
  void filterCompletedOrdersByDay() {
    var today = DateTime.now();
    completedOrder.value = completedOrder.where((order) {
      DateTime orderDate = DateTime.parse(order["pickup_date"]);
      return orderDate.year == today.year &&
          orderDate.month == today.month &&
          orderDate.day == today.day;
    }).toList();
  }

  void fetchAllCompletedOrders() {
    getCompletedOrder();
  }

  void filterCompletedOrdersByMonth() {
    var startOfMonth = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var endOfMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 1)
        .subtract(Duration(days: 1));

    completedOrder.value = completedOrder.where((order) {
      DateTime orderDate = DateTime.parse(order["pickup_date"]);
      return orderDate.isAfter(startOfMonth) && orderDate.isBefore(endOfMonth);
    }).toList();
  }
}
