import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/utils/app_url/app_urls.dart';

import '../../../../utils/app_icons.dart';
import '../../../../utils/app_string.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  CategoryController categoryController = Get.put(CategoryController());
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        height: 130.h,
        child: Obx(
          () => categoryController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: categoryController
                      .categoryModel!.data!.attributes!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => categoryController.categoryProductRepo(
                          categoryController
                              .categoryModel!.data!.attributes![index].sId!,categoryController!
                          .categoryModel!.data!.attributes![index].name!),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 2))
                                ],
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 100.h,
                                    width: 100.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: Image.network(
                                          // "${AppUrls.imageUrl}${categoryController.categoryModel!.data!.attributes![index].categoryImage!}",
                                        categoryController.categoryModel!.data!.attributes![index].categoryImage!,
                                          fit: BoxFit.fill,

                                          ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(categoryController!.categoryModel!.data!
                                .attributes![index].name!, style: const TextStyle(color: Color(0xFF54A630)),)
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
