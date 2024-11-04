import 'dart:convert';

import 'package:cake_laya/feature/models/shop_model.dart';
import 'package:http/http.dart' as http;


class Repository{
  final String apiUrl = 'http://localhost:3000/api/shop';
  
  Future<ShopModel> fetchShopData() async{
    final response = await http.get(Uri.parse(apiUrl));

    if(response.statusCode == 200){
      var data = json.decode(response.body);
      return ShopModel.fromJson(data);
    }else{
      throw Exception("Failed to load shop data");
    }

  }
  
}