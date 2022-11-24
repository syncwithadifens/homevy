import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/review_model.dart';
import 'package:homevy/services/review_service.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:image_picker/image_picker.dart';

class ReviewController extends GetxController {
  ReviewService reviewService = ReviewService();
  ReviewModel? userReview;
  final isLoading = false.obs;
  final star = 0.0.obs;
  final reviewCtrl = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? image;

  Future<void> getReview(int currentProductId) async {
    isLoading.value = true;
    try {
      userReview = await reviewService.getAllReview(currentProductId);
      if (userReview!.info == 'Review Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addReview(int currentProductId) async {
    if (reviewCtrl.text.isNotEmpty && star.value != 0.0 && image != null) {
      File file = File(image!.path);
      final response = await reviewService.addUserReview(
          currentProductId, '${star.value}', reviewCtrl.text, file);
      if (response == 'Review berhasil di input') {
        Get.to(() => const HomePage());
      } else {
        Get.snackbar('Hmmm', response,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5),
            backgroundColor: Colors.red);
      }
    } else {
      Get.snackbar('Blank fields', 'Rating / Review / Photo is required',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 5),
          backgroundColor: Colors.red);
    }
  }

  void selectImg() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
