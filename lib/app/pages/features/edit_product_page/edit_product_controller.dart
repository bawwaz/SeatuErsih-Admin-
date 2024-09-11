import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class EditProductController extends GetxController {
  var isLoading = false.obs;
  var orderNames = ['Regular Clean', 'Deep clean'];
  var selectedProduct = ''.obs;
  var idProduct = ''.obs;
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
  }

  void setSelectedProduct(String value) {
    selectedProduct.value = value;
    if (selectedProduct.value == 'Regular Clean') {
      idProduct.value = '1';
    } else {
      idProduct.value = '2';
    }
  }

  Future<void> postEditProduct() async {
    // final url =
    //     'http://seatuersih.pradiptaahmad.tech/api/laundry/update/${idProduct.value}?_method=put';
    final url = ApiEndpoint.baseUrl;

    var data = {
      'name': selectedProduct.value,
      'description': descController.text,
      'price': priceController.text,
    };

    final headers = this.headers;

    try {
      isLoading(true);
      if (headers.isEmpty) {
        showCustomSnackbar('Error', 'No authentication token found.',
            isError: true);
        return;
      }

      var response = await http.post(
        Uri.parse('$url/laundry/update/${idProduct.value}?_method=put'),
        headers: headers,
        body: json.encode(data),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        descController.clear();
        priceController.clear();
        isLoading(false);
        Get.back();
        showCustomSnackbar('Success', 'Berhasil diedit');
      } else {
        isLoading(false);
        showCustomSnackbar('Error', 'Failed to submit data: ${response.body}',
            isError: true);
      }
    } catch (e) {
      isLoading(false);
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
