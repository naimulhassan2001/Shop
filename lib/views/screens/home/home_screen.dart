
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_string.dart';
import '../your_cart/your_cart_screen.dart';
import 'inner_widget/category.dart';
import 'inner_widget/home_screen_slider.dart';
import 'inner_widget/recent_product_girdview.dart';
import 'inner_widget/search_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(AppString.deliveryAddress,style: TextStyle(color: Colors.black87, fontSize: 14.sp),),
            Text(AppString.newShop,style: TextStyle(fontSize: 19.sp),)
          ],
        ),

        actions: [
          IconButton(onPressed: (){
            Get.to(YourCartScreen());
          }, icon: const Icon(Icons.shopping_cart)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),


      /// body part
      body:  Padding(
        padding: EdgeInsets.all(8.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchWidget(),

              // SizedBox(height: 50,),
              const HomeScreenSilder(),
              // SizedBox(height: 50,),

               const Text((AppString.category)),
               const CategoryWidget(),

              const Text(AppString.recentProduct),
               RecentProductGirdView(),
            ],
          ),
        ),
      ),
    );
  }
}
