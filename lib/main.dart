import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shop/helpers/share_pref_helper.dart';
import 'package:shop/models/hive_model.dart';
import 'package:shop/views/widgets/bottom_nav_bar.dart';
import 'themes/theme_light.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
  await SharePrefHelper.getSharePrefData();

  var directory = await getApplicationCacheDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('database') ;


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
          // home: SharePrefHelper.token.isEmpty? SignInScreen():BottomNavBar(),
          //   home: SearchScreen(),
          // home: DetailsProductScreen(),
          //  home: YourCartScreen(),
          // home: PaymentMethodScreen(),
          // home: CheckoutScreen(),
          // home: HomeScreen(),
          home: BottomNavBar()
        ) ;
      },
    );
  }
}
