import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateAccountAllFiled extends StatelessWidget {
  CreateAccountAllFiled({super.key});

  // SignUpController signUpController = Get.put(SignUpController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Text(
              "Full Name",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          TextFormField(
            validator: (value){
              if(value!.isEmpty) {
                return "Please, Enter you Full Name" ;
              }
            },
            decoration: const InputDecoration(
              hintText: "Enter you Full Name",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
            child: Text(
              "Email".tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          TextFormField(
            validator: (value){
              if(value!.isEmpty) {
                return "Please, Enter you Email" ;
              }
            },
            decoration: const InputDecoration(
              hintText: "Enter you Email",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
            child: Text(
              "Mobile Number",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextFormField(
            validator: (value){
              if(value!.isEmpty) {
                return "Please, Enter you Mobile Number" ;
              }
            },
            decoration: const InputDecoration(
              hintText: "Enter you Mobile Number",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
            child: Text(
              "password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextFormField(
            validator: (value){
              if(value!.isEmpty) {
                return "Please, Enter you Password" ;
              }
            },
            decoration: const InputDecoration(
              hintText: "Enter you password",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 4.h),
            child: Text(
              "conform Password",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            validator: (value){
              if(value!.isEmpty) {
                return "Please, Enter you Conform Password" ;
              }
            },
            decoration: const InputDecoration(
              hintText: "Enter conform Password",
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
