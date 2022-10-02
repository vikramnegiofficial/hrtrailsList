import "package:http/http.dart" as http;
import 'dart:convert';

class ProductApi {
  Future<Map<String, dynamic>> getProducts(Map data) async {
    final response = await http.post(
      Uri.parse("https://api.ertrails.in/user/newProducts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, dynamic>{
          "offset": "1",
          "limit": 10,
          "comp_num": "56",
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      print("eeeeeeeeeeeeeeeeeeeeeee");
      throw Exception('Failed to load products');
    }
  }
}
