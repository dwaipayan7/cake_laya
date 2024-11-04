import 'dart:convert';
import 'package:cake_laya/feature/models/shop_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  // Replace with the deployed backend server URL
  final String apiUrl = 'https://cake-laya-backend.onrender.com';
  // Fetch data (GET request)
  Future<List<ShopModel>> fetchShopData() async {
    final response = await http.get(Uri.parse('$apiUrl/api/shops'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ShopModel.fromJson(item)).toList();
    } else {
      print('Failed to load shop data: ${response.statusCode} ${response.body}');
      throw Exception("Failed to load shop data");
    }
  }
}
