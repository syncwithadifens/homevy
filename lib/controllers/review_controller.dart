import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homevy/models/review_model.dart';
import 'package:homevy/services/review_service.dart';

class ReviewController extends GetxController {
  ReviewService reviewService = ReviewService();
  ReviewModel? userReview;
  final isLoading = false.obs;

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
}
