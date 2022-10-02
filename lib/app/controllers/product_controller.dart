import 'dart:convert';

import 'package:first_day_app/app/data/api/product_api.dart';
import 'package:first_day_app/app/data/models/product_model.dart';
import 'package:first_day_app/app/data/repository/product_repo.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class ProductController extends GetxController {
  var product = [].obs;
  var isLoading = true.obs;
  var allProducts = <Result>[].obs;
  ProductRepo productRepo = ProductRepo();
  List<Result> productsList = <Result>[].obs;
  Result productModel = Result();

  // List<ProductModel> productsList = [];
  // ProductModel productDetails = ProductModel();
  List<Rate> rateModel = [];
  Rate rateDetails = Rate();
  List<Rate> notForSellModel = [];
  Rate notForSellDetails = Rate();
  Gallery galleryDetails = Gallery();

  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  Future<List<Result>> fetchProduct() async {
    allProducts.clear();
    Map dataReq = {
      "offset": "1",
      "limit": 10,
      "comp_num": "56",
    };
    try {
      isLoading(true);
      Map<dynamic, dynamic>? data = await productRepo.getProducts(dataReq);
      // dynamic response = await ProductApi().getProducts(data);

      // print(response);
      if (data != null) {
        // product.value = products;
        // String responseString = jsonEncode(data);
        print("pppppppppppppppppppp");
        // productModel = ProductModel.fromJson(responseString);
        // print(response["result"]);
        for (var i in data["result"]) {
          if (i["rate"] != null) {
            // String resultString = jsonEncode(data["result"][i]);
            // Result result = Result.fromJson(resultString);
            // productModel.add(result);
            if (i['rate'] != null) {
              for (var j = 0; j < i['rate'].length; j++) {
                rateDetails = Rate(
                  rate: i['rate'][j]['rate'],
                  rate_type: i['rate'][j]['rate_type'],
                  discount_percent: i['rate'][j]['discount_percent'] * 1.0,
                  add_by: i['rate'][j]['add_by'],
                  add_on: i['rate'][j]['add_on'],
                  is_member: i['rate'][j]['is_member'],
                  is_active: i['rate'][j]['is_active'],
                  company_num: i['rate'][j]['company_num'],
                  name: i['rate'][j]['name'],
                  is_rent: i['rate'][j]['is_rent'],
                );
                rateModel.add(rateDetails);
              }
            }
            if (i['notForSell'] != null) {
              for (var j = 0; j < i['notForSell'].length; j++) {
                notForSellDetails = Rate(
                  rate: i['notForSell'][j]['rate'],
                  rate_type: i['notForSell'][j]['rate_type'],
                  discount_percent: i['notForSell'][j]['discount_percent'],
                  add_by: i['notForSell'][j]['add_by'],
                  add_on: i['notForSell'][j]['add_on'],
                  is_member: i['notForSell'][j]['is_member'],
                  is_active: i['notForSell'][j]['is_active'],
                  company_num: i['notForSell'][j]['company_num'],
                  name: i['notForSell'][j]['name'],
                  is_rent: i['notForSell'][j]['is_rent'],
                );
                notForSellModel.add(notForSellDetails);
              }
            }
            galleryDetails = Gallery(
              small_thumbnail_link: i['gallery']['small_thumbnail_link'],
              medium_thumbnail_link: i['gallery']['medium_thumbnail_link'],
            );
            productModel = Result(
              addedOn: i['added_on'],
              moq: i['moq'],
              type: i['type'],
              increaseQuantity: i['increaseQuantity'],
              name: i['name'],
              productNo: i['productNo'],
              prodGroupId: i['prodGroupId'],
              mrp: i['mrp'],
              quickProductCheck: i['quickProductCheck'],
              txnQuantity: i['txnQuantity'],
              txnQuantity2: i['txnQuantity2'],
              rate: rateModel,
              notForSell: notForSellModel,
              slug: i['slug'],
              slug2: i['slug2'],
              ratings: i['ratings'],
              gallery: galleryDetails,
            );
            productsList.add(productModel);
            allProducts.value = productsList;
          }
        }
      }
      update();
      print(productModel);
      return allProducts;
    } finally {
      isLoading(false);
      return allProducts;
    }
  }

  
}
