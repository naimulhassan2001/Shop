import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/your_cart_controoler.dart';
import '../../../utils/app_string.dart';
import '../../widgets/custom_buton_outline.dart';
import '../../widgets/custom_text.dart';
import '../payment method/payment_method_screen.dart';
import '../your_cart/widget/cart_item.dart';
import 'function/bottom_sheet_model.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  CartController cartController = Get.put(CartController());

  BottomSheetModel bottomSheetModel = BottomSheetModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.checkouts),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                CustomText(
                  title: AppString.deliveryTo,
                  fontSize: 16.sp,
                ),
                const Spacer(),
                CustomText(title: AppString.newShop),
                const Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
            const Divider(),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  var item = cartController.cartList[index];

                  return CartItem(
                    name: item['name'],
                    image: item['image'],
                    variant: item['variant'],
                    price: item['price'],
                    quantity: item['quantity'],
                    checkBox: false,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(title: AppString.hideList, color: Colors.green),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                bottomSheetModel.deliveryOptionSheet(context);
              },
              child: Container(
                height: 50.h,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1.w, color: const Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.selectTheDeliveryOption,
                        style: TextStyle(
                          color: const Color(0xFF939393),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        )),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 12,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Divider(),
            SizedBox(
              height: 16.h,
            ),
            GestureDetector(
              onTap: () {
                bottomSheetModel.deliveryOptionSheet(context);
              },
              child: Container(
                height: 50.h,
                padding: const EdgeInsets.all(10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1.w, color: const Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppString.appleDiscount,
                        style: TextStyle(
                          color: const Color(0xFF939393),
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        )),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 12,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title: AppString.totals),
                CustomText(
                  title: "\$ 00,0",
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomButtonOutLine(
              title: AppString.continueForPayments,
              onTap: () {
                Get.to(PaymentMethodScreen());
              },
              backgroundColor: const Color(0xFFF0F2F1),
            ),
          ],
        ),
      ),
    );
  }
}
