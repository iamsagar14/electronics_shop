import 'dart:convert';

import 'package:electronicss_shop/screens/dataModel/item_model.dart';
import 'package:http/http.dart' as http;

const itemurl = "https://electronic-ecommerce.herokuapp.com/api/v1/product";

class ItemNetworkService {
  Future<List<ItemModel>> fetchItem() async {
    http.Response response = await http.get(Uri.parse(itemurl));
    if (response.statusCode == 200) {
      Map productData = jsonDecode(response.body);
      List<dynamic> products = productData['results'];
      return products.map((json) => ItemModel.fromjson(json)).toList();
      //return electronicproduct;
    } else {
      throw Exception('something went wrong ');
    }
  }
}
