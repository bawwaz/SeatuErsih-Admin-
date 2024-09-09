import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class OrderManagementController extends GetxController {
  var pendingOrder = <Map<String, dynamic>>[].obs;
  var inprogressOrder = <Map<String, dynamic>>[].obs;
  var completedOrder = <Map<String, dynamic>>[].obs;
  var declinedOrder = <Map<String, dynamic>>[].obs;
  var waitingOrder = <Map<String, dynamic>>[].obs;
  var statusOpen = <String, dynamic>{}.obs;
  RxString waitingLength = ''.obs;

  var isStoreOpen = true.obs;
  var isLoading = true.obs;
  final box = GetStorage();
  var token = ''.obs;

  final chartReg = [].obs;
  final chartDeep = [].obs;
  var currentWeekOrders = 0.obs;
  var lastWeekOrders = 0.obs;
  var orderDifference = 0.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getPendingOrder();
    getWaitingOrder();
    getInprogressOrder();
    getCompletedOrder();
    getDeclinedOrder();
    getChartReg();
    getChartDeep();
    getStatusOpen();
    refreshOrders();
  }

  void toggleStoreStatus(bool value) async {
    isStoreOpen.value = value;
    await postStatusOpen();
  }

  Future<void> postStatusOpen() async {
    final url = ApiEndpoint.baseUrl;
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/store-status/status-toko/1?_method=put';
    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.post(
        Uri.parse('$url/store-status/status-toko/1?_method=put'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        await getStatusOpen();
        if (isStoreOpen.value) {
          showCustomSnackbar('Success', 'Status Toko: Buka');
        } else {
          showCustomSnackbar('Success', 'Status Toko: Tutup', isError: false);
        }
      } else {
        showCustomSnackbar(
            'Error', 'Failed to update store status: ${response.body}',
            isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  Future<void> refreshOrders() async {
    await getPendingOrder();
    await getWaitingOrder();
    await getInprogressOrder();
    await getCompletedOrder();
    await getDeclinedOrder();
    await getChartReg();
    await getChartDeep();
    await getStatusOpen();
  }

  Future<void> getPendingOrder() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/order/status/pending';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      pendingOrder.clear();
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(
        Uri.parse('$url/order/status/pending'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          pendingOrder.value = List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          pendingOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } // else {
      //   showCustomSnackbar(
      //       'Error', 'Failed to retrieve pending orders: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  Future<void> getWaitingOrder() async {
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/order/status/waiting_for_payment';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      waitingOrder.clear();
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(
        Uri.parse('$url/order/status/waiting_for_payment'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          waitingOrder.value = List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          waitingOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      }
      waitingLength.value = waitingOrder.length.toString();
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  Future<void> getInprogressOrder() async {
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/order/status/in-progress';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      inprogressOrder.clear();
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(
        Uri.parse('$url/order/status/in-progress'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          inprogressOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          inprogressOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } //else {
      //   showCustomSnackbar(
      //       'Error', 'Failed to retrieve in-progress orders: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  Future<void> getCompletedOrder() async {
    final url = ApiEndpoint.baseUrl;
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/order/status/completed';
    final headers = this.headers;

    try {
      completedOrder.clear();
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

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
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } //else {
      //   showCustomSnackbar(
      //       'Error', 'Failed to retrieve completed orders: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  Future<void> getDeclinedOrder() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/order/status/decline';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      declinedOrder.clear();
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(
        Uri.parse('$url/order/status/decline'),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          declinedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          declinedOrder.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } // else {
      //   showCustomSnackbar(
      //       'Error', 'Failed to retrieve declined orders: ${response.body}',
      //       isError: true);
      // }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
      print(e);
    }
  }

  void calculateOrderDifference(List data) {
    if (data.length >= 2) {
      currentWeekOrders.value = data.last['total'];
      lastWeekOrders.value = data[data.length - 2]['total'];
      orderDifference.value = currentWeekOrders.value - lastWeekOrders.value;
    }
  }

  Future<void> getChartReg() async {
    isLoading.value = true;
    // final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http
          .get(Uri.parse('$url/order/chart/regular_clean'), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data is List) {
          chartReg.assignAll(data);
          calculateOrderDifference(data);
        } else {
          print('no data found');
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getChartDeep() async {
    isLoading.value = true;
    // final url = 'http://seatuersih.pradiptaahmad.tech/api';
    final url = ApiEndpoint.baseUrl;
    final token = box.read('token');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(Uri.parse('$url/order/chart/deep_clean'),
          headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data != null && data is List) {
          if (data.isEmpty) {
            Get.snackbar(
              'No Data',
              'No deep clean data found.',
              snackPosition: SnackPosition.BOTTOM,
            );
          }
          chartDeep.assignAll(data);
          calculateOrderDifference(data);
        } else {
          print('no data found');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  Future<void> getStatusOpen() async {
    final url = ApiEndpoint.baseUrl;
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/store-status/status-toko/1';
    final headers = this.headers;

    isLoading.value = true;

    try {
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(Uri.parse('$url/store-status/status-toko/1'), headers: headers);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is Map && decodedResponse.containsKey('data')) {
          statusOpen.value = Map<String, dynamic>.from(decodedResponse['data']);
          isStoreOpen.value = statusOpen['is_open'];
        } else {
          showCustomSnackbar('Error', 'Unexpected response format',
              isError: true);
        }
      } else {
        showCustomSnackbar(
            'Error', 'Failed to retrieve store status: ${response.body}',
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
