
import 'package:shared_preferences/shared_preferences.dart';

class SharePrefHelper {
  static  String token = "";
  static Future<void> getSharePrefData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token")??"";
  }

}