import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/hive_controller.dart';
import 'package:shop/controllers/product_details_controller.dart';
import 'package:shop/models/hive_model.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import '../../../controllers/searchControler.dart';
import '../../../utils/app_icons.dart';
import '../../../utils/app_string.dart';
import '../../widgets/costom_multiline_text.dart';
import '../../widgets/custom_text.dart';
import '../home/function/create_folder_dailog.dart';

class DetailsProductScreen extends StatelessWidget {
  DetailsProductScreen({super.key, this.name = ""});

  String name;
  RxBool isInfo = false.obs;

  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());
  FolderCreateDialog folderCreateDialog = FolderCreateDialog();

  HiveController hiveController = Get.put(HiveController());

  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {

    hiveController.cartList() ;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(color: Color(0xFF54A630)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                        //   color: Colors.grey.shade400,
                        //   spreadRadius: 1,
                        //   blurRadius: 20,
                        // offset: Offset(1, 3)
                        )
                  ]),
                  // height: 400,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.r),
                    child: Image.network(
                      "${productDetailsController!.productDetails_Model!.data!.attributes!.productImage!}",
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (isInfo.value == true) {
                        isInfo.value = false;
                      } else {
                        isInfo.value = true;
                      }
                    },
                    icon: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.black12,
                        child: const Icon(
                          Icons.info_outline,
                          color: Color(0xFF54A630),
                        ))),
                IconButton(
                    onPressed: () {

                      NotesModel notesModel = NotesModel(
                          title: name,
                          description: productDetailsController
                              .productDetails_Model!
                              .data!
                              .attributes!
                              .productDescription!,
                          image: productDetailsController.productDetails_Model!
                              .data!.attributes!.productImage!,
                          price: productDetailsController.productDetails_Model!
                              .data!.attributes!.productPrice
                              .toString());

                      hiveController.addToCart(notesModel);
                    },
                    icon: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.black12,
                        child: Obx(() => Icon(
                          hiveController.isCartAdded.contains(name) ?  Icons.favorite : Icons.favorite_border,
                          color: Color(0xFF54A630),
                        )))),
                IconButton(
                    onPressed: () {
                      folderCreateDialog.createFolder(
                          context,
                          productDetailsController.productDetails_Model!.data!
                              .attributes!.productName!,
                          productDetailsController.productDetails_Model!.data!
                              .attributes!.productImage!,
                          productDetailsController.productDetails_Model!.data!
                              .attributes!.productPrice!
                              .toString());
                    },
                    icon: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.black12,
                        child: const Icon(
                          Icons.create_new_folder_outlined,
                          color: Color(0xFF54A630),
                        ))),
              ],
            ),

            Obx(
              () => isInfo.value
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                            title:
                                "Design Name : ${productDetailsController.productDetails_Model!.data!.attributes!.productName!}",
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF54A630)),
                        const SizedBox(
                          height: 4,
                        ),
                        // Row(
                        //   children: [
                        //     for(int i = 0; i< 5; i++)
                        //       Row(
                        //         children: [
                        //           Icon(Icons.star_outline_outlined, color: Colors.orangeAccent,),
                        //         ],
                        //       )
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 4,
                        // ),

                        Row(
                          children: [
                            CustomText(
                                title:
                                    "Price : ${productDetailsController.productDetails_Model!.data!.attributes!.productPrice!} ",
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF54A630)),
                            SvgPicture.asset(AppIcon.bdTK,
                                height: 14.h, color: const Color(0xFF54A630)),
                            const SizedBox(
                              width: 4,
                            ),
                            // CustomText(
                            //     title: "( 219 people buy this )",
                            //
                            //     fontWeight: FontWeight.w400),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: AppString.description,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF54A630),
                            ),
                            // CustomButton(
                            //   height: 35.h,
                            //     title: "Add to Cart",
                            //     onTap: (){
                            // },
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomMultiLineText(
                          title: productDetailsController.productDetails_Model!
                              .data!.attributes!.productDescription!,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                      ],
                    )
                  : SizedBox(),
            ),
            // const SizedBox(
            //   height: 16,
            // ),
            // CustomText(
            //     title: AppString.chooseTheColor,
            //     color: const Color(0xFF939393),
            //     fontWeight: FontWeight.w400),
            // SizedBox(
            //   height: 40,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: colorList.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 4.0),
            //         child: Container(
            //           width: 60,
            //           height: 40,
            //           decoration: ShapeDecoration(
            //             color: colorList[index],
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8)),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // const SizedBox(
            //   height: 12,
            // ),
            // const Divider(),
            // const SizedBox(
            //   height: 8,
            // ),
            // Row(
            //   children: [
            //     Image.asset(AppImages.apple),
            //     const SizedBox(
            //       width: 12,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         CustomText(
            //           title: AppString.appleStore,
            //           fontSize: 16,
            //           color: const Color(0xFF393F42),
            //         ),
            //         CustomText(
            //           title: "online 12 mins ago",
            //           fontSize: 12,
            //           color: const Color(0xFF939393),
            //         )
            //       ],
            //     ),
            //     const Spacer(),
            //     CustomButtonOutLine(
            //       title: AppString.follow,
            //       onTap: () {},
            //       height: 40,
            //       fontSize: 14,
            //     )
            //   ],
            // ),
            // const Divider(),
            // const SizedBox(
            //   height: 8,
            // ),
            const SizedBox(
              height: 12,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     CustomText(
            //       title: AppString.description,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //       color: const Color(0xFF54A630),
            //     ),
            //     // CustomButton(
            //     //   height: 35.h,
            //     //     title: "Add to Cart",
            //     //     onTap: (){
            //     // },
            //     // )
            //   ],
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
            // CustomMultiLineText(
            //   title: productDetailsController!.productDetails_Model!.data!.attributes!.productDescription!,
            // ),
            // const SizedBox(
            //   height: 14,
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      //   child: ProductAction(),
      // )
    );
  }
}
