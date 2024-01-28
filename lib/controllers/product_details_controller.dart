import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/models/ProductDetails_Model.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';
import 'package:shop/views/screens/details%20product/details_product_screen.dart';

class ProductDetailsController extends GetxController{

  ProductDetails_Model? productDetails_Model;
  RxBool isLoading = false.obs;

  Future<void> getProductDetailsRepo(String productId) async{
    isLoading.value = true;
    var data = await ApiService.getApi("${AppUrls.product}/$productId", {"Authorization": "Bearer ${SharePrefHelper.token}"});

    isLoading(false);
    if(data.statusCode == 200){
      var responseData = jsonDecode(data.responseJson);
      productDetails_Model = ProductDetails_Model.fromJson(responseData);
      print('Status Code: ${data.statusCode}');
      print('Message: ${data.message}');
      Get.to(DetailsProductScreen());
    }else {
      // Handle the error case here
      print('Error: ${data.statusCode}');
      print('Error message: ${data.message}');
    }
  }
}