import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop/views/widgets/custom_button.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            const Text("Full Name"),
            SizedBox(height: 4.h),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Enter you Full Name"),
            ),
            SizedBox(height: 16.h),
            const Text("E-mail"),
            SizedBox(height: 4.h),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter you E-mail"),
            ),
            SizedBox(height: 16.h),
            const Text("Mobile Number"),
            SizedBox(height: 4.h),
            TextFormField(
              decoration:
                  const InputDecoration(hintText: "Enter you Mobile Number"),
            ),
            SizedBox(height: 16.h),
            const Text("password"),
            SizedBox(height: 4.h),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
            SizedBox(height: 16.h),
            const Text("Conform password"),
            SizedBox(height: 4.h),
            TextFormField(
              decoration: const InputDecoration(hintText: "Conform Password"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h ),
        child: CustomButton(title: "Sign Up", onTap: () {}),
      ),
    );
  }
}
