import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderDetailWaitForPaymentController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var orderId = ''.obs;
  var orderDetail = <String, dynamic>{}.obs;
  var customerItem = <Map<String, dynamic>>[].obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    print(Get.arguments);
    orderId.value = Get.arguments.toString();
    getDetailOrder();
    getCustomerItem();
  }

  Future<void> refreshOrders() async {
    await getDetailOrder();
    await getCustomerItem();
  }

  Future<void> getDetailOrder() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/order/get/${orderId.value}';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(Uri.parse(url), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          orderDetail.value =
              Map<String, dynamic>.from(decodedResponse['data']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } else {
        showCustomSnackbar('Error', 'Failed to retrieve data: ${response.body}',
            isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCustomerItem() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/shoe/getshoe/${orderId.value}';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(Uri.parse(url), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          customerItem.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        }
      } else {
        showCustomSnackbar('Error', 'Failed to retrieve data: ${response.body}',
            isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void showCustomSnackbar(String title, String message,
      {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Color(0xffff3333) : Color(0xff17B169),
      colorText: Colors.white,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      animationDuration: Duration(milliseconds: 800),
      duration: Duration(seconds: 3),
      icon: Icon(
        isError ? Icons.error : Icons.check_circle,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      barBlur: 20,
      overlayBlur: 0.3,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  Map<String, String> get headers {
    print('Retrieved Token: ${token.value}');
    return {
      "Accept": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Content-Type": "application/json"
    };
  }
}
