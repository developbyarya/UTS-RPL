import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posapp/controller/baseUrl.dart';
import 'package:posapp/domain/model/item_model.dart';
import 'package:posapp/model/ItemModel.dart' as PresentationModel;
class ProductController {
  final List<ItemModel> products = [];

  Future<void> getAllProduct() async {
    try {
      print('Fetching products from: ${BaseUrl.baseUrl}/products');
      final response = await http.get(Uri.parse('${BaseUrl.baseUrl}/products'));
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      
      if (response.statusCode == 200) {
        final List<ItemModel> products = itemFromJson(response.body);
        print('Parsed ${products.length} products');
        this.products.clear();
        this.products.addAll(products);
      } else {
        print('Error: HTTP ${response.statusCode}');
      }
    } catch (e) {
      print('Exception occurred: $e');
    }
  }
  
  List<ItemModel> itemFromJson(String body) {
    try {
      final List<ItemModel> products = [];
      final Map<String, dynamic> data = jsonDecode(body);
      print('JSON data length: ${data.length}');
      
      for (var item in data['data']) {
        print('Processing item: $item');
        products.add(ItemModel.fromJson(item));
      }
      return products;
    } catch (e) {
      print('Error parsing JSON: $e');
      return [];
    }
  }

  List<PresentationModel.ItemModel> toPresentationModel(List<ItemModel> items) {
    return items.map((item) => ItemModel.toPresentationModel(item)).toList();
  }

  Future<bool> createProduct({
    required String name,
    required String description,
    required int price,
    required int stock,
    required String imagePath, // local file path
    required String category,
    required double discount,
  }) async {
    final url = Uri.parse('${BaseUrl.baseUrl}/api/products');
    var request = http.MultipartRequest('POST', url);
    request.fields['name'] = name;
    request.fields['description'] = description;
    request.fields['price'] = price.toString();
    request.fields['stock'] = stock.toString();
    request.fields['category'] = category;
    request.fields['discount'] = discount.toString();
    
    // Attach image file
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    try {
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print('Create product response: \\${response.statusCode}');
      print('Body: \\${response.body}');
      if (response.statusCode == 201 || response.statusCode == 200) {
        return true;
      } else {
        print('Failed to create product: \\${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception during product creation: $e');
      return false;
    }
  }
}