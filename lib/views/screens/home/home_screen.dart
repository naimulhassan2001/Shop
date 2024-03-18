import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';
import 'package:shop/controllers/home_controller.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/views/screens/search_screen/search_screen.dart';

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

  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.getSliderRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        title: Text(
          AppString.newShop,
          style: TextStyle(fontSize: 19.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(SearchScreen());
              },
              icon: const Icon(Icons.search)),
        ],
      ),

      /// body part
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeScreenSilder(),
            Padding(
                padding: EdgeInsets.only(left: 8.w, top: 10.h),
                child: const Text(AppString.category,
                    style: TextStyle(fontSize: 18, color: Color(0xFF54A630)))),
            CategoryWidget(),
            Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: const Text(AppString.recentProduct,
                    style: TextStyle(fontSize: 18, color: Color(0xFF54A630)))),
            RecentProductGirdView(),
          ],
        ),
      ),
    );
  }
}
