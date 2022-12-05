import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/review_model.dart';
import 'package:homevy/services/review_service.dart';
import 'package:homevy/theme/styles.dart';
import 'package:image_picker/image_picker.dart';

import '../ui/pages/home_page.dart';

class ReviewController extends GetxController {
  ReviewService reviewService = ReviewService();
  ReviewModel? userReview;
  final isLoading = false.obs;
  final star = 0.0.obs;
  final reviewCtrl = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? image;
  final isImgSelected = false.obs;

  Future<void> getReview(int currentProductId) async {
    isLoading.value = true;
    try {
      userReview = await reviewService.getAllReview(currentProductId);
      if (userReview!.info == 'Review Berhasil Diambil') {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    }
  }

  Future<void> addReview(int currentProductId) async {
    if (reviewCtrl.text.isNotEmpty && star.value != 0.0 && image != null) {
      File file = File(image!.path);
      var bytes = file.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      final imageSize = mb.toPrecision(2);
      if (imageSize <= 2.0) {
        final response = await reviewService.addUserReview(
            currentProductId, '${star.value}', reviewCtrl.text, file);
        if (response == 'Review berhasil di input') {
          Get.snackbar(
            'Thanks for your rate',
            response,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            backgroundColor: Colors.green,
            colorText: whiteColor,
          );
          Future.delayed(
            const Duration(seconds: 1),
            () => Get.to(() => const HomePage()),
          );
        } else if (response == 'notfound') {
          Get.snackbar(
            'Hmmm',
            'Product not found',
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            backgroundColor: redColor,
            colorText: whiteColor,
          );
        } else {
          Get.snackbar(
            'Hmmm',
            response,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            backgroundColor: redColor,
            colorText: whiteColor,
          );
        }
      } else {
        Get.snackbar(
          'Fail to upload image',
          'Image file size must be below 2 MB',
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
          backgroundColor: redColor,
          colorText: whiteColor,
        );
        isImgSelected.value = false;
      }
    } else {
      Get.snackbar(
        'Oooops',
        'Rating / Review / Photo is required',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
        backgroundColor: redColor,
        colorText: whiteColor,
      );
    }
  }

  void selectImg() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    isImgSelected.value = true;
  }
}
