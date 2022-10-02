import 'package:first_day_app/app/controllers/product_controller.dart';
import 'package:first_day_app/app/data/models/product_model.dart';
import 'package:first_day_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // ProductController productController = Get.find();
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Products",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.notifications),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.more_vert),
                  ],
                )
              ],
            )),
        FutureBuilder(
            future: productController.fetchProduct(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: MediaQuery.of(context).size.height - 150,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Loading..."),
                    ],
                  )),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height - 150,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    // itemCount: 4,
                    itemBuilder: (BuildContext context, int i) {
                      return FetchedItem(snapshot, i);
                    },
                  ),
                );
              }
            }),
      ],
    ));
  }

  InkWell FetchedItem(AsyncSnapshot<List<Result>> snapshot, int i) {
    String getDate(String date) {
      var dateParse = DateTime.parse(date);
      var formattedDate =
          "${dateParse.day}-${dateParse.month}-${dateParse.year}";
      return formattedDate;
    }

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCTPAGE, arguments: snapshot.data![i]);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, blurRadius: 5, offset: Offset(0, 5))
            ]),
        child: ListTile(
          title: Text(snapshot.data![i].name!,
              style: const TextStyle(fontSize: 18)),
          subtitle: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(getDate(snapshot.data![i].addedOn.toString())),
              ],
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          leading: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              // image: DecorationImage(
              //     image: NetworkImage(snapshot.data![i].image!),
              //     fit: BoxFit.cover)
            ),
            child: FadeInImage(
              width: 75,
              height: 100,
              placeholder: const AssetImage("assets/placeholder.png"),
              image: NetworkImage(
                snapshot.data![i].gallery!.small_thumbnail_link!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
