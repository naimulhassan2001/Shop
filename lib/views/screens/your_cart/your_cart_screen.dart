
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/your_cart_controoler.dart';
import '../../widgets/custom_buton_outline.dart';
import '../../widgets/custom_text.dart';
import '../checkouts/checkokuts_screen.dart';
import '../checkouts/function/bottom_sheet_model.dart';
import 'widget/cart_item.dart';

class YourCartScreen extends StatelessWidget {
  YourCartScreen({super.key});


  CartController cartController = Get.put(CartController()) ;
  BottomSheetModel bottomSheetModel = BottomSheetModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                CustomText(title: "Delivery to", fontSize: 16.sp,),
                const Spacer(),
                CustomText(title: "Salatiga City, Central java"),
                const Icon(Icons.keyboard_arrow_down_outlined)
              ],
            ),
            const Divider(),
            SizedBox(height: 8.h,),
            const Divider(),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {

                  var item =cartController.cartList[index] ;

                  return CartItem(
                    name: item['name'],
                    image: item['image'],
                    variant: item['variant'],
                    price: item['price'],
                    quantity: item['quantity'],
                  ) ;
                },),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(title: "Totals"),
                CustomText(title: "\$ 00,0", fontWeight: FontWeight.w600,)
              ],
            ),
            SizedBox(height: 16.h,),



          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: CustomButtonOutLine(title: "Continue for payments", onTap: (){
          Get.to(CheckoutScreen()) ;

        }, backgroundColor: const Color(0xFFF0F2F1),),
      ),

    );
  }
}
