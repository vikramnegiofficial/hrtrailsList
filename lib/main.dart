import 'package:first_day_app/app/controllers/product_controller.dart';
import 'package:first_day_app/app/routes/app_routes.dart';
import 'package:first_day_app/app/ui/home.dart';
import 'package:first_day_app/app/ui/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        Routes.PRODUCTPAGE: (context) => PRODUCTPAGE(),
      },
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key});
//   ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   productController.fetchProduct();
//                   Get.to(HomePage());
//                 },
//                 child: const Text("Home Page"))
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
