import 'package:flutter/material.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';
import 'package:homevy/utils/responsive_layout.dart';

import '../widgets/custom_profile.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: blackColor,
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ResponsiveLayout(
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CustomProfile()),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextField(
                  controller: authController.nameCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: greyColor,
                    ),
                    hintText: 'full name',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    filled: true,
                    fillColor: lightGreyColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: authController.phoneCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: greyColor,
                    ),
                    hintText: 'phone',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    filled: true,
                    fillColor: lightGreyColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller: authController.emailCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: greyColor,
                    ),
                    hintText: 'email',
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    filled: true,
                    fillColor: lightGreyColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Obx(() => TextField(
                      controller: authController.passwordCtrl,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: authController.isHide.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: greyColor,
                        ),
                        hintText: 'password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            authController.isHide.toggle();
                          },
                          icon: authController.isHide.value
                              ? Icon(
                                  Icons.visibility,
                                  color: greyColor,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: primaryColor,
                                ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        filled: true,
                        fillColor: lightGreyColor,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                      ),
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: Obx(() => TextField(
                        controller: authController.passwordConfirmCtrl,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: authController.isHide.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_reset,
                            color: greyColor,
                          ),
                          hintText: 'password confirmation',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: lightGreyColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                      )),
                ),
              ),
              Obx(() => authController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GestureDetector(
                      onTap: () => authController.register(),
                      child: Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor),
                        child: Center(
                          child: Text(
                            'Join',
                            style: subtitleStyle.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an a account?',
                      style: subtitleStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
                          style: subtitleStyle.copyWith(color: primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
          desktop: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomProfile(
                        h: 200,
                        w: 200,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: subtitleStyle.copyWith(
                                color: whiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register',
                      style: titleStyle.copyWith(fontSize: 32),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: TextField(
                        controller: authController.nameCtrl,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: greyColor,
                          ),
                          hintText: 'full name',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: lightGreyColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: authController.phoneCtrl,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: greyColor,
                          ),
                          hintText: 'phone',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: lightGreyColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextField(
                        controller: authController.emailCtrl,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: greyColor,
                          ),
                          hintText: 'email',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          filled: true,
                          fillColor: lightGreyColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Obx(() => TextField(
                            controller: authController.passwordCtrl,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: authController.isHide.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: greyColor,
                              ),
                              hintText: 'password',
                              suffixIcon: IconButton(
                                onPressed: () {
                                  authController.isHide.toggle();
                                },
                                icon: authController.isHide.value
                                    ? Icon(
                                        Icons.visibility,
                                        color: greyColor,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: primaryColor,
                                      ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              filled: true,
                              fillColor: lightGreyColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Obx(() => TextField(
                            controller: authController.passwordConfirmCtrl,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            obscureText: authController.isHide.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_reset,
                                color: greyColor,
                              ),
                              hintText: 'password confirmation',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              filled: true,
                              fillColor: lightGreyColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          )),
                    ),
                    Obx(() => authController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GestureDetector(
                            onTap: () => authController.register(),
                            child: Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: secondaryColor),
                              child: Center(
                                child: Text(
                                  'Join',
                                  style: subtitleStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an a account?',
                            style: subtitleStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'Login',
                                style:
                                    subtitleStyle.copyWith(color: primaryColor),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
