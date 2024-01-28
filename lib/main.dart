import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/views/screens/home/inner_widget/bottom_nav_bar.dart';
import 'package:shop/views/screens/sign_up/sign_up.dart';

import 'themes/theme_light.dart';
import 'views/screens/sign_in/sign_in.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await SharePrefHelper.getSharePrefData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return GetMaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          // home: SignUpScreen(),
          home: SharePrefHelper.token.isEmpty? SignInScreen():BottomNavBar(),
          //   home: SearchScreen(),
          // home: DetailsProductScreen(),
          //  home: YourCartScreen(),
          // home: PaymentMethodScreen(),
          // home: CheckoutScreen(),
        ) ;
      },
    );
  }
}
