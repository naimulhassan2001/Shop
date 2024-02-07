import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/models/Product_Model.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';

class ProductController extends GetxController{

  Product_model? product_model;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    productRepo();
    super.onInit();
  }

  Future<void> productRepo() async {
    isLoading.value = true;
    var data = await ApiService.getApi(AppUrls.product, {}, isHeader: false);

    isLoading(false);
    if(data.statusCode == 200){
      var responseData = jsonDecode(data.responseJson);
      product_model = Product_model.fromJson(responseData);
      print('Status Code: ${data.statusCode}');
      print('Message: ${data.message}');
    }else {
      // Handle the error case here
      print('Error: ${data.statusCode}');
      print('Error message: ${data.message}');
    }

  }



}