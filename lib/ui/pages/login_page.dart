import 'package:flutter/material.dart';
import 'package:homevy/controllers/auth_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';
import 'package:homevy/ui/pages/register_page.dart';
import 'package:homevy/utils/responsive_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ResponsiveLayout(
          mobile: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Center(
                  child: Image.asset(
                    'assets/comfy.png',
                    width: 290,
                  ),
                ),
              ),
              Text(
                'Login',
                style: titleStyle.copyWith(fontSize: 32),
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
                padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'forgot password?',
                    style: subtitleStyle,
                  ),
                ),
              ),
              Obx(() => authController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : GestureDetector(
                      onTap: () => authController.login(),
                      child: Container(
                        width: Get.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: secondaryColor),
                        child: Center(
                          child: Text(
                            'Login',
                            style: subtitleStyle.copyWith(
                                color: whiteColor,
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
                      'Don\'t have an account?',
                      style: subtitleStyle,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => const RegisterPage());
                        },
                        child: Text(
                          'Register',
                          style: subtitleStyle.copyWith(color: primaryColor),
                        ))
                  ],
                ),
              )
            ],
          ),
          desktop: Row(
            children: [
              Expanded(child: Image.asset('assets/comfy.png')),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: titleStyle.copyWith(fontSize: 32),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
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
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'forgot password?',
                        style: subtitleStyle,
                      ),
                    ),
                    Obx(() => authController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GestureDetector(
                            onTap: () => authController.login(),
                            child: Container(
                              margin: const EdgeInsets.only(top: 50),
                              width: Get.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: secondaryColor),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: subtitleStyle.copyWith(
                                      color: whiteColor,
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
                            'Don\'t have an account?',
                            style: subtitleStyle,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(() => const RegisterPage());
                              },
                              child: Text(
                                'Register',
                                style:
                                    subtitleStyle.copyWith(color: primaryColor),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
