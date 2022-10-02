import 'package:first_day_app/app/routes/app_routes.dart';
import 'package:first_day_app/app/ui/home.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    // GetPage(
    //   name : Routes.PRODUCTPAGE, page : () => const ProductPage(),
    // ),
  ];
}
