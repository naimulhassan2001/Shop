import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';

class BottomSheetModel {
  deliveryOptionSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: AppString.selectTheDeliveryOption,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  CustomText(
                    title: AppString.express,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: AppString.oneToThereDaysDelivery),
                      CustomText(title: "\$1499", fontWeight: FontWeight.w600),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  CustomText(
                    title: AppString.regular,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: AppString.twoToFourDaysDelivery),
                      CustomText(title: "\$799", fontWeight: FontWeight.w600),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Column(
                children: [
                  CustomText(
                    title: AppString.cargo,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: "7-14 days delivery"),
                      CustomText(title: "\$299", fontWeight: FontWeight.w600),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  noResponseButtonSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          height: 340.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: const SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        );
      },
    );
  }
}
