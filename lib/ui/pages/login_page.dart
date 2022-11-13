import 'package:flutter/material.dart';
import 'package:homevy/controllers/login_controller.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';
import 'package:homevy/ui/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(
                'assets/comfy.png',
                width: 290,
              ),
            ),
            Text(
              'Login',
              style: titleStyle.copyWith(fontSize: 32),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                controller: loginController.emailCtrl,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: greyColor,
                  ),
                  hintText: 'email',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                    controller: loginController.passwordCtrl,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: loginController.isHide.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: greyColor,
                      ),
                      hintText: 'password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          loginController.isHide.toggle();
                        },
                        icon: loginController.isHide.value
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
            Obx(() => loginController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GestureDetector(
                    onTap: () => loginController.login(),
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
            Row(
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
            )
          ],
        ),
      ),
    );
  }
}
