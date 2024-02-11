
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';
import 'package:shop/utils/app_string.dart';

class CategoryProductScreen extends StatelessWidget {
  CategoryProductScreen({super.key});

  CategoryController categoryController = Get.put(CategoryController()) ;
 ProductDetailsController productDetailsController = Get.put(ProductDetailsController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.products),
        centerTitle: true,
      ),
      body: Obx(() => categoryController.Loading.value
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
            categoryController.product_model!.data!.attributes!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 5, crossAxisCount: 2),
            itemBuilder: (context, index) {
              // var product = searchScreenController.products[index];
              // var image = product['image'];
              // var name = product['name'];
              // var price = product['price'];

              return GestureDetector(
                onTap: () {
                  productDetailsController.getProductDetailsRepo(
                      categoryController!
                          .product_model!.data!.attributes![index].sId!);
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 10,
                          spreadRadius: 1,
                          offset: Offset(0,4)
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 8,
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              categoryController!.product_model!.data!
                                  .attributes![index].productImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
