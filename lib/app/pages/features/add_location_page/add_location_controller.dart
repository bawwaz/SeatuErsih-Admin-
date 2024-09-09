import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:seatu_ersih_admin/api/api_endpoint.dart';

class AddLocationController extends GetxController {
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  final GlobalKey<FormState> kabupatenKey = GlobalKey<FormState>();
  final GlobalKey<FormState> KecamatanKey = GlobalKey<FormState>();
  var kabupaten_name = <Map<String, dynamic>>[].obs;
  var kecamatan_name = <Map<String, dynamic>>[].obs;
  var selectedKabupatenId = 0.obs;
  var savedLocations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  final box = GetStorage();
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    if (token.value.isEmpty) {
      print('Token is not saved in GetStorage.');
    }
    getAllKabupaten();
    getAllKecamatan();
  }

  Future<void> postKabupaten() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/kabupaten/add';
    final url = ApiEndpoint.baseUrl;

    var data = {
      'kabupaten': kabupatenController.text,
    };

    final headers = this.headers;

    if (kabupatenKey.currentState!.validate()) {
      try {
        isLoading(true);
        if (headers.isEmpty) {
          showCustomSnackbar('Error', 'No authentication token found.',
              isError: true);
          return;
        }

        var response = await http.post(
          Uri.parse('$url/kabupaten/add'),
          headers: headers,
          body: json.encode(data),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 201) {
          await getAllKabupaten();
          kabupatenController.clear();
          isLoading(false);
          showCustomSnackbar('Success', 'Kabupaten berhasil ditambahkan');
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
  }

  Future<void> postKecamatan() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/kecamatan/add';
    final url = ApiEndpoint.baseUrl;

    var data = {
      'kecamatan': kecamatanController.text,
      'kabupaten_id': selectedKabupatenId.value,
    };

    final headers = this.headers;

    if (KecamatanKey.currentState!.validate()) {
      try {
        isLoading(true);
        if (headers.isEmpty) {
          showCustomSnackbar('Error', 'No authentication token found.',
              isError: true);
          return;
        }

        var response = await http.post(
          Uri.parse('$url/kecamatan/add'),
          headers: headers,
          body: json.encode(data),
        );

        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        if (response.statusCode == 201) {
          await getAllKecamatan();
          kecamatanController.clear();
          selectedKabupatenId.value = 0;
          isLoading(false);
          showCustomSnackbar('Success', 'Kecamatan berhasil ditambahkan');
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
  }

  Future<void> getAllKabupaten() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/kabupaten/getall';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      var response =
          await http.get(Uri.parse('$url/kabupaten/getall'), headers: headers);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        kabupaten_name.value =
            List<Map<String, dynamic>>.from(decodedResponse['data']);
        mergeLocations();
      } else {
        showCustomSnackbar('Error', 'Failed to retrieve data', isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
    }
  }

  Future<void> getAllKecamatan() async {
    // final url = 'http://seatuersih.pradiptaahmad.tech/api/kecamatan/getall';
    final url = ApiEndpoint.baseUrl;
    final headers = this.headers;

    try {
      var response = await http.get(Uri.parse('$url/kecamatan/getall'), headers: headers);
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        kecamatan_name.value =
            List<Map<String, dynamic>>.from(decodedResponse['data']);
        mergeLocations();
      } else {
        showCustomSnackbar('Error', 'Failed to retrieve data', isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
    }
  }

  void mergeLocations() {
    savedLocations.clear();
    for (var kabupaten in kabupaten_name) {
      var matchedKecamatan = kecamatan_name
          .where((kec) =>
              kec['kabupaten_id'].toString() == kabupaten['id'].toString())
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
