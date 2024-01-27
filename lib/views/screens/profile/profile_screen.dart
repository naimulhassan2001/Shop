import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_string.dart';
import '../../widgets/custom_text.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  String email = "farveshossen@gmail.com";

  String name = "Farves Hossen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 200.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF54A630),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r))),
              ),
              Positioned(
                  top: 128.h,
                  child: Image.asset(
                    AppImages.profile,
                    height: 124.h,
                    width: 124.w,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              children: [
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  title: name,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                CustomText(
                  title: email,
                  fontSize: 16.sp,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 100.h,
                ),
                const Divider(
                  color: Colors.green,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomText(
                  title: AppString.helpAndFeedback,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomText(
                  title: AppString.contactUs,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
