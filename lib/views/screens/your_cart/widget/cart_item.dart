import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_string.dart';
import '../../../widgets/custom_text.dart';


class CartItem extends StatelessWidget {
  CartItem(
      {super.key,
      required this.name,
      required this.image,
      required this.variant,
      required this.price,
      required this.quantity,
      this.checkBox = true});

  String image;

  String name;

  String variant;

  String price;

  String quantity;

  RxBool isChecked = false.obs;
  bool checkBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Center(
            child: checkBox
                ? Obx(() => Checkbox(
                    activeColor: Colors.green,
                    value: isChecked.value,
                    onChanged: (value) {
                      isChecked.value = value!;
                    }))
                : null,
          ),
          Expanded(flex: 2, child: Image.asset(image)),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
              flex: 7,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      maxLines: 1,
                      style: TextStyle(
                          color: const Color(0xFF393F42),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CustomText(
                      title: "${AppString.variant}: $variant",
                      color: const Color(0xFF939393)),
                  // const Spacer(),
                  Row(
                    children: [
                      CustomText(title: "\$ $price"),
                      const Spacer(),
                      Center(
                        child: checkBox
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: 18.w,
                                      height: 18.h,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF939393)),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Color(0xFF939393),
                                        size: 16,
                                      )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  CustomText(title: quantity),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                      width: 18.w,
                                      height: 18.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1.w,
                                              color: const Color(0xFF939393)),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Color(0xFF939393),
                                        size: 16,
                                      )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                      width: 24.w,
                                      height: 24.h,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(
                                          side: BorderSide(
                                              width: 1.w,
                                              color: const Color(0xFF939393)),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.delete_outlined,
                                        color: Color(0xFF939393),
                                        size: 16,
                                      )),
                                ],
                              )
                            : const Text("1 quantity"),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
