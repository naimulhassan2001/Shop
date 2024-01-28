
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';

class CategoryProductScreen extends StatelessWidget {
  CategoryProductScreen({super.key});

  CategoryController categoryController = Get.put(CategoryController()) ;
 ProductDetailsController productDetailsController = Get.put(ProductDetailsController()) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => categoryController.Loading.value
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox(
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
              child: Card(
                elevation: 0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Image.network(
                        categoryController!.product_model!.data!
                            .attributes![index].productImage!,
                        fit: BoxFit.fill,
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
