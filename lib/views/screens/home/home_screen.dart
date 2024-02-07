
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';
import 'package:shop/controllers/home_controller.dart';
import 'package:shop/controllers/product_controller.dart';

import '../../../utils/app_string.dart';
import '../your_cart/your_cart_screen.dart';
import 'inner_widget/category.dart';
import 'inner_widget/home_screen_slider.dart';
import 'inner_widget/recent_product_girdview.dart';
import 'inner_widget/search_widget.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryController categoryController = Get.put(CategoryController());

  ProductController productController = Get.put(ProductController());

  HomeController homeController = Get.put(HomeController()) ;
  @override
  void initState() {
    homeController.getSliderRepo() ;
    super.initState();
  }

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
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const SearchWidget()),

              // SizedBox(height: 50,),
              HomeScreenSilder(),
              // SizedBox(height: 50,),

               Padding(
                 padding: EdgeInsets.only(left: 8.w),
                   child: const Text(AppString.category, style: TextStyle(fontSize: 18))),
                CategoryWidget(),
              SizedBox(height: 5.h,),
              Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: const Text(AppString.recentProduct, style: TextStyle(fontSize: 18))),
              SizedBox(height: 5.h,),
               RecentProductGirdView(),
            ],
          ),
        ),
      ),
    );
  }
}
