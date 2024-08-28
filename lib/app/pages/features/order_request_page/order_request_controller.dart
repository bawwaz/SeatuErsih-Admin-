import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih_admin/app/global_component/navbar/btmnavcontroller.dart';
import 'package:seatu_ersih_admin/app/global_component/navbar/navbar.dart';

class OrderRequestController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var orderId = ''.obs;
  var detailOrder = <String, dynamic>{}.obs;
  var isLoading = false.obs;

  var noteText = ''.obs;
  var isDeclineButtonEnabled = false.obs;
  var isAcceptButtonLoading = false.obs; // New variable
  var isDeclineButtonLoading = false.obs; // New variable

  @override
  void onInit() {
    super.onInit();
    ever(
      noteText,
      (_) {
        isDeclineButtonEnabled.value = noteText.isNotEmpty;
      },
    );
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    orderId.value = Get.arguments;
    print(Get.arguments);
    getDetailOrder();
  }

  void updateNoteText(String value) {
    noteText.value = value;
    isDeclineButtonEnabled.value = value.trim().isNotEmpty;
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
          detailOrder.value =
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

  Future<void> postUpdateStatus(String orderStatus) async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/order/update';
    var data = {'id': Get.arguments, 'order_status': orderStatus};

    isAcceptButtonLoading.value = true; // Set loading to true

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${box.read('token')}",
          "Content-Type": "application/json"
        },
        body: json.encode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);

        if (orderStatus == "decline" || orderStatus == "waiting_for_payment") {
          Get.offAll(() => BottomNavBar(), arguments: 2);
          final BottomNavigationController navController = Get.find();
          navController.currentIndex.value = 2;

          String snackbarMessage = orderStatus == "decline"
              ? 'Pesanan berhasil ditolak dan silahkan cek didecline'
              : 'Pesanan berhasil diupdate silahkan cek di Waiting For Payment';

          showCustomSnackbar(
            'Success',
            snackbarMessage,
          );
        } else {
          showCustomSnackbar('Error', 'Unexpected order status: $orderStatus',
              isError: true);
        }
      } //else {
      //   showCustomSnackbar('Error', 'Failed to submit data: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    } finally {
      isAcceptButtonLoading.value = false; // Set loading to false
    }
  }

  Future<void> postDeclineNote() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/order/update';
    var data = {
      'id': orderId.value,
      'order_status': 'decline',
      'decline_note': noteText.value
    };

    isDeclineButtonLoading.value = true; // Set loading to true

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      print('Decline Note: ${noteText.value}');

      if (response.statusCode == 200) {
        Get.offAll(() => BottomNavBar(), arguments: 2);
        final BottomNavigationController navController = Get.find();
        navController.currentIndex.value = 2;

        showCustomSnackbar(
          'Success',
          'Pesanan berhasil ditolak dan silahkan cek didecline',
        );
      } //else {
      //   showCustomSnackbar('Error', 'Failed to submit data: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    } finally {
      isDeclineButtonLoading.value = false; // Set loading to false
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
