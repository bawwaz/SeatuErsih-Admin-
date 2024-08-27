import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var username = ''.obs;
  var profileImagePath = ''.obs;
  var isLoading = false.obs;
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    username.value = box.read('username') ?? '';
    profileImagePath.value = box.read('profileImagePath') ?? '';
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final confirm = await Get.dialog<bool>(
        AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            'Konfirmasi',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          content: Text(
            'Yakin memilih foto ini?',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Get.back(result: false),
              child: Text(
                'Tidak',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff7EC1EB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => Get.back(result: true),
              child: Text(
                'Iya',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      );

      if (confirm == true) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/${pickedFile.name}';
        final File file = File(pickedFile.path);
        await file.copy(filePath);

        profileImagePath.value = filePath;
        box.write('profileImagePath', filePath);
      }
    }
  }

  void showImageOptions() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.image, color: Color(0xff7EC1EB)),
              title: Text(
                'Pilih dari Galeri',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.back();
                pickImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.red),
              title: Text(
                'Hapus Gambar',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.back();
                deleteImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  void deleteImage() {
    profileImagePath.value = '';
    box.remove('profileImagePath');
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

  Future<void> logout() async {
    isLoading.value = true;
    final url = 'http://seatuersih.pradiptaahmad.tech/api/admins/logout';
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token.value}',
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        box.remove('token');
        showCustomSnackbar('Success', 'Anda berhasil logout');
        Get.offAllNamed('/login');
      } else {
        showCustomSnackbar('Error', 'Gagal logout: ${response.body}',
            isError: true);
      }
    } catch (e) {
      showCustomSnackbar('Error', 'Exception occurred: $e', isError: true);
    } finally {
      isLoading.value = false;
    }
  }
}
