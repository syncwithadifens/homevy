import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:homevy/models/user_model.dart';
import 'package:homevy/services/auth_service.dart';
import 'package:homevy/ui/pages/home_page.dart';
import 'package:homevy/ui/pages/login_page.dart';

class AuthController extends GetxController {
  AuthService authService = AuthService();
  final isHide = true.obs;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordConfirmCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final isLoading = false.obs;
  UserModel? userData;
  String? message;

  Future<void> login() async {
    isLoading.value = true;

    // NOTE: Menjalankan service signInWithEmail
    final userCredential =
        await authService.signInWithEmail(emailCtrl.text, passwordCtrl.text);
    message = userCredential.info;

    // NOTE: Cek apakah login success
    if (message == 'Login Berhasil') {
      // NOTE: Menyimpan data user ke Get Storage setelah di encode
      GetStorage box = GetStorage();
      String storeUserData = json.encode(userCredential);
      box.write("userData", storeUserData);
      Future.delayed(
        const Duration(seconds: 2),
        () {
          isLoading.value = false;
          Get.snackbar('Success', message ?? '',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.green);
        },
      );
      Future.delayed(
        const Duration(seconds: 3),
        () {
          Get.to(() => const HomePage());
        },
      );
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          Get.snackbar('Error', message ?? '',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.red);
        },
      );
    }
  }

  Future<void> register() async {
    isLoading.value = true;
    if (emailCtrl.text.isEmail) {
      final userCredential = await authService.signUpWithEmail(
          emailCtrl.text,
          passwordCtrl.text,
          passwordConfirmCtrl.text,
          nameCtrl.text,
          phoneCtrl.text);
      message = userCredential.info;
      if (message == 'Register Berhasil') {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            isLoading.value = false;
            Get.snackbar('Yeeeeaaah', message ?? '',
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.only(bottom: 5),
                backgroundColor: Colors.green);
          },
        );
        Future.delayed(
          const Duration(seconds: 3),
          () {
            Get.to(() => const LoginPage());
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            isLoading.value = false;
            Get.snackbar('Oh nooooo!', message ?? '',
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.only(bottom: 5),
                backgroundColor: Colors.red);
          },
        );
      }
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          Get.snackbar('Oh nooooo!', 'Email address in wrong format ',
              snackPosition: SnackPosition.BOTTOM,
              margin: const EdgeInsets.only(bottom: 5),
              backgroundColor: Colors.red);
        },
      );
    }
  }

  @override
  void onInit() async {
    super.onInit();
    // NOTE: Memanggil data user dari storage dan simpan ke variabel userData
    GetStorage box = GetStorage();
    if (box.read('userData') != null) {
      userData = UserModel.fromJson(jsonDecode(box.read("userData")));
    }
  }
}
