import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/sign_in_controller.dart';

import '../../widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({super.key});

  SignInController signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your account",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16.h),
            const Text("E-mail"),
            SizedBox(height: 4.h),
            TextFormField(
              controller: signInController.emailController,
              decoration: const InputDecoration(hintText: "Enter you E-mail"),
            ),
            SizedBox(height: 16.h),
            const Text("password"),
            SizedBox(height: 4.h),
            TextFormField(
              controller: signInController.passwordController,
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        child: CustomButton(title: "Sign In", onTap: () {
          signInController.signInRepo();
        }),
      ),
    );
  }
}
