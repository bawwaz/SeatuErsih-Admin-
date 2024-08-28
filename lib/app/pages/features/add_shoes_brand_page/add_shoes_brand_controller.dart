import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddShoesBrandController extends GetxController {
  TextEditingController brandController = TextEditingController();
  final GlobalKey<FormState> brandKey = GlobalKey<FormState>();
  var brand_name = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token');
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getAllBrand();
  }

  Future<void> postBrand() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/brand/add';

    var data = {
      'brand': brandController.text,
    };

    final headers = this.headers;

    if (brandKey.currentState!.validate()) {
      try {
        isLoading(true);

        if (headers.isEmpty) {
          showCustomSnackbar('Error', 'No authentication token found.',
              isError: true);
          return;
        }

        var response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: json.encode(data),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 201) {
          await getAllBrand();
          brandController.clear();
          isLoading(false);
          showCustomSnackbar('Success', 'Sepatu berhasil ditambahkan');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> getAllBrand() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/brand/getall';

    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        if (decodedResponse is List) {
          brand_name.value = List<Map<String, dynamic>>.from(decodedResponse);
        } else if (decodedResponse is Map &&
            decodedResponse.containsKey('data')) {
          brand_name.value =
              List<Map<String, dynamic>>.from(decodedResponse['data']);
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
