import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddLocationController extends GetxController {
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  var kabupaten_name = <Map<String, dynamic>>[].obs;
  var kecamatan_name = <Map<String, dynamic>>[].obs;
  var selectedKabupatenId = 0.obs;
    var savedLocations = <Map<String, dynamic>>[].obs;

  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token');
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getAllKabupaten();
    getAllKecamatan();
  }

  Future<void> postKabupaten() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/kabupaten/add';

    var data = {
      'kabupaten': kabupatenController.text,
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
        await getAllKabupaten();
        kabupatenController.clear();
        Get.snackbar('Success', 'Kabupaten berhasil ditambahkan');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> postKecamatan() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/kecamatan/add';

    var data = {
      'kecamatan': kecamatanController.text,
      'kabupaten_id': selectedKabupatenId.value, 
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
        await getAllKecamatan();
        kecamatanController.clear();
        selectedKabupatenId.value = 0;
        Get.snackbar('Success', 'Kecamatan berhasil ditambahkan');
      } else {
        Get.snackbar('Error', 'Failed to submit data: ${response.body}');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
    }
  }

  Future<void> getAllKabupaten() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/kabupaten/getall';
    final headers = this.headers;

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        kabupaten_name.value = List<Map<String, dynamic>>.from(decodedResponse['data']);
        mergeLocations();
      } else {
        Get.snackbar('Error', 'Failed to retrieve data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
    }
  }

  Future<void> getAllKecamatan() async {
    final url = 'http://seatuersih.pradiptaahmad.tech/api/kecamatan/getall';
    final headers = this.headers;

    try {
      var response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        kecamatan_name.value = List<Map<String, dynamic>>.from(decodedResponse['data']);
        mergeLocations();
      } else {
        Get.snackbar('Error', 'Failed to retrieve data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Exception occurred: $e');
    }
  }

  void mergeLocations() {
    savedLocations.clear();
    for (var kabupaten in kabupaten_name) {
      var matchedKecamatan = kecamatan_name
          .where((kec) => kec['kabupaten_id'].toString() == kabupaten['id'].toString())
          .map((kec) => kec['kecamatan'])
          .toList();
      if (matchedKecamatan.isNotEmpty) {
        savedLocations.add({
          'kabupaten': kabupaten['kabupaten'],
          'kecamatan': matchedKecamatan.join(', '),
        });
      }
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
