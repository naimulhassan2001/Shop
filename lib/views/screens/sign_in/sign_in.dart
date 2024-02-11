import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/sign_in_controller.dart';
import 'package:shop/views/screens/sign_up/sign_up.dart';
import 'package:shop/views/widgets/custom_text.dart';

import '../../../utils/app_string.dart';
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
              AppString.signInAccount,
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
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(title: AppString.haveNotAccount),
                SizedBox(width: 4.w),
                InkWell(
                    onTap: (){
                      Get.to(SignUpScreen());
                    },
                    child: CustomText(title: AppString.signUp, color: const Color(0xFF67C4A7)),
                ),
              ],
            )
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
