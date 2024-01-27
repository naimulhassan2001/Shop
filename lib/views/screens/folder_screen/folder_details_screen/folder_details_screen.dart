import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_images.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';

class FolderDetailsScreen extends StatelessWidget {
  FolderDetailsScreen({
    super.key,
    required this.folderName,
    required this.note,
    required this.image,
    required this.productName,
    required this.price,
  });

  String folderName;

  String productName;

  String note;
  String image;
  String price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folderName),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  height: 300.h,
                  child: Image.asset(
                    AppImages.airPods,
                    fit: BoxFit.fill,
                  )),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: productName, fontSize: 16.sp),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: "\$ $price",
                            fontSize: 18.sp,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 8.h,
              ),
              CustomText(
                title: AppString.note,
                fontSize: 16.sp,
                color: const Color(0xFF393F42),
              ),
              SizedBox(
                height: 8.h,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    note,
                    textAlign: TextAlign.start,
                  )),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
