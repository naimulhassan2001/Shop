import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/models/CategoryProductModel.dart';
import 'package:shop/models/Category_model.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import 'package:shop/views/screens/home/inner_widget/category/category_product.dart';

import '../models/Product_Model.dart';

class CategoryController extends GetxController{
  CategoryProduct_Model? product_model;
  RxBool Loading= false.obs;


  Category_model? categoryModel ;
  RxBool isLoading= false.obs;

  @override
  void onInit() {
    categoryRepo();
    super.onInit();
  }
  
  Future<void> categoryRepo() async {
    isLoading.value = true;
    var data = await ApiService.getApi(AppUrls.category, {"Authorization":"Bearer ${SharePrefHelper.token}"});
    isLoading.value = false;
    print(data.statusCode);
    print(data.message);
    print(data.responseJson);
    if (data.statusCode == 200) {
      var responseData = jsonDecode(data.responseJson);
      categoryModel = Category_model.fromJson(responseData);

    } else {
      // Handle the error case here

    }

  }

  Future<void> categoryProductRepo(String categoryId) async {
    isLoading.value = true;
    var data = await ApiService.getApi(
        "${AppUrls.categoryWiseProduct}/$categoryId",
        {"Authorization": "Bearer ${SharePrefHelper.token}"});

    isLoading(false);
    if(data.statusCode == 200){
      var responseData = jsonDecode(data.responseJson);
      product_model = CategoryProduct_Model.fromJson(responseData);
      print('Status Code: ${data.statusCode}');
      print('Message: ${data.message}');
      Get.to(CategoryProductScreen());
    }else {
      // Handle the error case here
      print('Error: ${data.statusCode}');
      print('Error message: ${data.message}');
    }

  }



}