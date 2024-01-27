import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/app_images.dart';
import '../../../widgets/custom_buton_outline.dart';
import '../../../widgets/custom_text.dart';

class PaymentBottomSheet {
  successful(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.none,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.cancel_outlined))
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Image.asset(AppImages.success),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "Congrats! your payment is Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                "track you order or just chat directly to the seller Download order summary in down below",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                height: 50.h,
                width: 300,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.find_in_page_rounded,
                            size: 18,
                          ),
                          SizedBox(width: 8.w,),
                          CustomText(
                            title: 'order_invoice',
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.download,
                        size: 18,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomButtonOutLine(
                  height: 60.h,
                  backgroundColor: const Color(0xFF67C4A7),
                  title: "Continue",
                  textColor: Colors.white,
                  onTap: () {
                    // paymentBottomSheet.successful(context) ;
                  }),
            ],
          ),
        );

        //const Success();
      },
    );
  }
}
