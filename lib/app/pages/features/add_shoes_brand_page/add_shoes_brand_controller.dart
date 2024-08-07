import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddShoesBrandController extends GetxController {
  TextEditingController brandController = TextEditingController();
  var brand_name = <Map<String, dynamic>>[].obs;

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

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
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
        Get.snackbar('Success', 'Sepatu berhasil ditambahkan');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllBrand() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/brand/getall';

    final headers = this.headers;

    try {
      if (headers.isEmpty) {
        Get.snackbar('Error', 'No authentication token found.');
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
          Get.snackbar('Error', 'Unexpected response format');
        }
      } else {
        Get.snackbar('Error', 'Failed to retrieve data: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
      print(e);
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
}
