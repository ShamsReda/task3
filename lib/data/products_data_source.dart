import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class DataSource {
  static Future<List<ProductData>> getData() async {
    List<ProductData> dataproducts = [];
    try {
      final res = await http.get(Uri.parse('https://dummyjson.com/products'));

      if (res.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(res.body);

        for (var item in responseData['products']) {
          ProductData object1 = ProductData.fromJson(item);
          dataproducts.add(object1);
        }
      }
      return dataproducts;
    } catch (e) {
      print(e);
      return dataproducts;
    }
  }

  static List<ProductData> productsList = [];
}
