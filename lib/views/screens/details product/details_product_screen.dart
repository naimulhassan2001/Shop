import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
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

class DetailsProductScreen extends StatefulWidget {
  DetailsProductScreen({super.key, this.name = ""});

  String name;

  @override
  State<DetailsProductScreen> createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
  RxBool isInfo = false.obs;

  ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());

  FolderCreateDialog folderCreateDialog = FolderCreateDialog();

  HiveController hiveController = Get.put(HiveController());

  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() async{
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hiveController.cartList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: const TextStyle(color: Color(0xFF54A630)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 300,
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
                      child: PhotoView(
                        imageProvider: NetworkImage(productDetailsController.productDetails_Model!.data!.attributes!.productImage!), // Replace with your image path
                        minScale: PhotoViewComputedScale.contained * 0.8,
                        maxScale: PhotoViewComputedScale.covered * 2.0,

                        backgroundDecoration: const BoxDecoration(
                          color: Colors.white,
                        ),

                    )),
              ),),
            ),
            SizedBox(height: 16.h),

            Obx(
              () => isInfo.value
                  ? SingleChildScrollView(
                    child: Column(
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
                      ),
                  )
                  : SizedBox(),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            IconButton(
                onPressed: () {
                  folderCreateDialog.createFolder(
                      context,
                      productDetailsController
                          .productDetails_Model!.data!.attributes!.productName!,
                      productDetailsController
                          .productDetails_Model!.data!.attributes!.productImage!,
                      productDetailsController
                          .productDetails_Model!.data!.attributes!.productPrice!
                          .toString(),
                      productDetailsController
                          .productDetails_Model!.data!.attributes!.sId!);
                },
                icon: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.black12,
                    child: const Icon(
                      Icons.create_new_folder_outlined,
                      color: Color(0xFF54A630),
                    ))),
            IconButton(
                onPressed: () {
                  productDetailsController.downloadImage(productDetailsController
                      .productDetails_Model!.data!.attributes!.productImage!) ;
                },
                icon: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.black12,
                    child: const Icon(
                      Icons.download_rounded,
                      color: Color(0xFF54A630),
                    ))),
            IconButton(
                onPressed: () {
                  NotesModel notesModel = NotesModel(
                      title: widget.name,
                      description: productDetailsController.productDetails_Model!
                          .data!.attributes!.productDescription!,
                      image: productDetailsController
                          .productDetails_Model!.data!.attributes!.productImage!,
                      price: productDetailsController
                          .productDetails_Model!.data!.attributes!.productPrice
                          .toString());

                  hiveController.addToCart(notesModel);
                },
                icon: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.black12,
                    child: Obx(() => Icon(
                          hiveController.isCartAdded.contains(widget.name)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Color(0xFF54A630),
                        )))),
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

          ],
        ),
      ),
    );
  }
}
