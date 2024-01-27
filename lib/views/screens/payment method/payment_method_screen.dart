import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/your_cart_controoler.dart';
import '../../widgets/custom_buton_outline.dart';
import '../../widgets/custom_text.dart';
import 'function/payment_bottom_sheet.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});

  CartController cartController = Get.put(CartController());
  PaymentBottomSheet paymentBottomSheet = PaymentBottomSheet() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment method"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart_outlined),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text("5", style: TextStyle(fontSize: 14.sp)),
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(title: "select existing card"),
              SizedBox(
                height: 16.h,
              ),

              Container(
                height: 60.h,
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    )),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText( title: '**** **** **** 1934',),
                      const Icon(Icons.delete, size: 18,)
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 19.h,
              ),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                  title: "or input new card",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                title: "card number",
                color: const Color(0xFF939393),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter card number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r))),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomText(
                          title: "Exp date",
                          color: const Color(0xFF939393),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "mm/yy",
                              hintStyle:
                                  const TextStyle(color: Color(0xFF939393)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CustomText(
                          title: "Security code",
                          color: const Color(0xFF939393),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              labelText: "ccv/csv",
                              hintStyle:
                                  const TextStyle(color: Color(0xFF939393)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r))),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                title: "card holder",
                color: const Color(0xFF939393),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Enter card holder name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r))),
              ),
              SizedBox(
                height: 14.h,
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order summary"),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: 20,
                  )
                ],
              ),
              SizedBox(
                height: 13.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Totals"), Text(r"$195524")],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: CustomButtonOutLine(
            height: 60.h,
            backgroundColor: const Color(0xFF67C4A7),
            title: "Select Payment Method",
            textColor: Colors.white,
            onTap: () {
              paymentBottomSheet.successful(context) ;
            }),
      ),
    );
  }
}
