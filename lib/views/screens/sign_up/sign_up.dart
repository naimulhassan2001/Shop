import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/sign_up_controller.dart';
import 'package:shop/views/widgets/custom_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  SignUpController signUpController = Get.put(SignUpController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                controller: signUpController.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Full Name";
                  }
                  return null; // Return null when the validation passes
                },
                decoration:
                    const InputDecoration(hintText: "Enter your Full Name"),
              ),
              SizedBox(height: 16.h),
              const Text("E-mail"),
              SizedBox(height: 4.h),
              TextFormField(
                controller: signUpController.emailController,
                validator: (value) {
                  // You can add email validation logic here if needed
                  if (value == null || value.isEmpty) {
                    return "Please enter your E-mail";
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Enter your E-mail"),
              ),
              SizedBox(height: 16.h),
              const Text("Mobile Number"),
              SizedBox(height: 4.h),
              TextFormField(
                controller: signUpController.numberController,
                validator: (value) {
                  // You can add mobile number validation logic here if needed
                  if (value == null || value.isEmpty) {
                    return "Please enter your Mobile Number";
                  }
                  return null;
                },
                decoration:
                    const InputDecoration(hintText: "Enter your Mobile Number"),
              ),
              SizedBox(height: 16.h),
              const Text("Password"),
              SizedBox(height: 4.h),
              TextFormField(
                controller: signUpController.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your Password";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Enter Password"),
              ),
              SizedBox(height: 16.h),
              const Text("Confirm Password"),
              SizedBox(height: 4.h),
              TextFormField(
                controller: signUpController.confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please confirm your Password";
                  }
                  return null;
                },
                decoration: const InputDecoration(hintText: "Confirm Password"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.h),
        child: CustomButton(
          title: "Sign Up",
          onTap: () {
            signUpController.signUpRepo();
            // Add your logic here when the form is successfully validated
          },
        ),
      ),
    );
  }
}
