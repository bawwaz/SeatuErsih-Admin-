import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  var token = ''.obs;
  var username = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    token.value = box.read('token') ?? '';
    username.value = box.read('username') ?? '';
  }

  Future<void> logout() async {
    isLoading.value = true; // Menampilkan loading
    final url =
        'http://seatuersih.pradiptaahmad.tech/api/admins/logout'; // Ganti dengan URL yang sesuai
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
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        box.remove('token');
        Get.snackbar(
          'Logout',
          'Anda sudah logout',
          snackPosition: SnackPosition.TOP,
        );
        Get.offAllNamed('/login');
      } else {
        Get.snackbar(
          'Error',
          'Gagal logout: ${response.body}',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Exception occurred: $e',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
