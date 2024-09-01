import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PaymentDetailController extends GetxController {
  final box = GetStorage();
  var orderId = ''.obs;
  var transactionDetail = <String, dynamic>{}.obs;
  var isLoading = false.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    orderId.value = Get.arguments;
    print(Get.arguments);
    getTransactionDetail();
  }

  Future<void> getTransactionDetail() async {
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/transactions/get-transaction?id=${orderId.value}';

    isLoading.value = true;

    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${token.value}",
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print(url);

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse['status'] == 'success' &&
            decodedResponse.containsKey('transaction')) {
          transactionDetail.value =
              Map<String, dynamic>.from(decodedResponse['transaction']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } else {
        showCustomSnackbar('Error', 'Failed to retrieve data', isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
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
      backgroundColor:
          isError ? const Color(0xffff3333) : const Color(0xff17B169),
      colorText: Colors.white,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      animationDuration: const Duration(milliseconds: 800),
      duration: const Duration(seconds: 3),
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
