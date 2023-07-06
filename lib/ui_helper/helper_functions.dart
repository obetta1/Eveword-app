import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.black,
      colorText: Colors.white);
}
