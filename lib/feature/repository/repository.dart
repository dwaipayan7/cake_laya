import 'dart:convert';
import 'package:cake_laya/feature/models/shop_model.dart';
import 'package:http/http.dart' as http;

class Repository {

  final String apiUrl = 'https://cake-laya-backend.onrender.com';
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

  Future<DeliverySettings> postDeliveryData(DeliverySettings deliveryData) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/delivery'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(deliveryData.toJson()),
    );

    if (response.statusCode == 201) {
      return DeliverySettings.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to save the data: ${response.body}');
    }
  }


}

