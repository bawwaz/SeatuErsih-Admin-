import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetCheckerController extends GetxController {
  var isConnected = true.obs;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
    });
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
