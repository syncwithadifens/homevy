import 'package:flutter/material.dart';
import 'package:homevy/theme/styles.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: greyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  hintText: 'full name',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  fillColor: greyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_android),
                  hintText: 'phone',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  fillColor: greyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'email',
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  fillColor: greyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: false,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'password',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  filled: true,
                  fillColor: greyColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    hintText: 'password confirmation',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    filled: true,
                    fillColor: greyColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor),
              child: Center(
                child: Text(
                  'Join Now',
                  style: subtitleStyle.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Join us before?',
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
            )
          ],
        ),
      ),
    );
  }
}
