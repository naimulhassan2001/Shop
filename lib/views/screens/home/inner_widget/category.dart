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
        height: 150.h,
        child: Obx(
          () => categoryController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: categoryController!
                      .categoryModel!.data!.attributes!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => categoryController.categoryProductRepo(
                          categoryController!
                              .categoryModel!.data!.attributes![index].sId!),
                      child: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 5.w, top: 5.h, bottom: 5.h),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: Offset(0, 4))
                            ],
                            borderRadius: BorderRadius.circular(12.r),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.w),
                                child: SizedBox(
                                  height: 100.h,
                                  width: 100.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: Image.network(
                                        "${AppUrls.imageUrl}${categoryController.categoryModel!.data!.attributes![index].categoryImage!}",
                                        fit: BoxFit.fill,

                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(categoryController!.categoryModel!.data!
                                  .attributes![index].name!)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  // scrollDirection: Axis.horizontal,
                  // children: [
                  //
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 25.w),
                  //         height: 50.h,
                  //         width: 50.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12.r),
                  //           color: const Color(0xFFEDF7FF),
                  //         ),
                  //         child: Image.asset(AppIcon.fashion2),
                  //       ),
                  //       const Text(AppString.school)
                  //     ],
                  //   ),
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 25.w),
                  //         height: 50.h,
                  //         width: 50.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12.r),
                  //           color: const Color(0xFFFFEDDD),
                  //         ),
                  //         child: Image.asset(AppIcon.fashion3),
                  //       ),
                  //       const Text(AppString.sports)
                  //     ],
                  //   ),
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 25.w),
                  //         height: 50.h,
                  //         width: 50.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12.r),
                  //           color: const Color(0xFFFFEDDD),
                  //         ),
                  //         child: Image.asset(AppIcon.fashion4),
                  //       ),
                  //       const Text(AppString.electronic)
                  //     ],
                  //   ),
                  //   Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.only(right: 25.w),
                  //         height: 50.h,
                  //         width: 50.w,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12.r),
                  //           color: const Color(0xFFFFEDDD),
                  //         ),
                  //         child: Image.asset(AppIcon.all),
                  //       ),
                  //       Container(
                  //           margin: EdgeInsets.only(left: 6.w),
                  //           child: const Text(
                  //             AppString.more,
                  //           ))
                  //     ],
                  //   ),
                  // ],
                ),
        ));
  }
}
