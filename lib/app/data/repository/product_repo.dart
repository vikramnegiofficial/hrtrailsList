import 'package:first_day_app/app/data/api/product_api.dart';
import 'package:flutter/cupertino.dart';

class ProductRepo {
  ProductApi productApi = ProductApi();

  Future<Map>? getProducts(Map data) async {
    Map<String, dynamic> response = await productApi.getProducts(data);
    print(response);
    return response;
  }
}
