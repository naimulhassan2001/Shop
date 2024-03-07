import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/product_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';
import 'package:shop/utils/app_url/app_urls.dart';

import '../../../../controllers/folder_controller.dart';
import '../../../../controllers/searchControler.dart';
import '../../details product/details_product_screen.dart';
import '../function/create_folder_dailog.dart';

class RecentProductGirdView extends StatelessWidget {
  RecentProductGirdView({super.key});

  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  FolderController folderController = Get.put(FolderController());

  FolderCreateDialog folderCreateDialog = FolderCreateDialog();

  ProductController productController = Get.put(ProductController());
  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.isLoading.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  productController.product_model!.data!.attributes!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 5,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                var product = searchScreenController.products[index];
                var image = product['image'];
                var name = product['name'];
                var price = product['price'];

                return GestureDetector(
                  onTap: () {
                    productDetailsController.getProductDetailsRepo(
                        productController!
                            .product_model!.data!.attributes![index].sId!,productController!
                        .product_model!.data!.attributes![index].productName!);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: Offset(0,0)
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.network(
                                "${productController!.product_model!.data!
                                    .attributes![index].productImage!}",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   flex: 7,
                        //   child: Column(
                        //     children: [
                        //       Text(name),
                        //       Text(price),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //         children: [
                        //           IconButton(
                        //               onPressed: () {},
                        //               icon: CircleAvatar(
                        //                   radius: 20.r,
                        //                   backgroundColor: Colors.black12,
                        //                   child: const Icon(Icons.favorite_border))),
                        //           IconButton(
                        //               onPressed: () {
                        //                 folderCreateDialog.createFolder(
                        //                     context, name, image, price);
                        //               },
                        //               icon: CircleAvatar(
                        //                   radius: 20.r,
                        //                   backgroundColor: Colors.black12,
                        //                   child: const Icon(Icons.edit_calendar))),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                );
              },
            ),

    ));


  }
}
