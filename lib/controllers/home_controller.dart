import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop/models/silder_model.dart';
import 'package:shop/services/api_services/api_services.dart';
import 'package:shop/utils/app_url/app_urls.dart';

import '../helpers/share_pref_helper.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;

  SilderModel? silderModel;

  RxBool isLoading = false.obs;

  Future<void> getSliderRepo() async {
    isLoading.value = true;

    var header = {"Authorization": "Bearer ${SharePrefHelper.token}"};

     ApiService.getApi(
      AppUrls.slider,
      {}, isHeader: false
    ).then((responseData){

       isLoading.value = false;
       if (responseData.statusCode == 200) {

         silderModel = SilderModel.fromJson(jsonDecode(responseData.responseJson));


       }
     });


  }
}
