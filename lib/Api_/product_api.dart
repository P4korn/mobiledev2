import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobiledev2/model/product_data.dart';

class ProductApiService {
  static const String baseUrl = 'http://10.0.2.2:8001';

  // Fetch (GET) Products
  Future<List<ProductData>> fetchProducts() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((item) => ProductData.fromJson(item)).toList();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Create (POST) Product
  Future<bool> createProduct(ProductData product) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/products'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()),
      );

      if (response.statusCode == 201) {
        return true; // Product successfully created
      } else {
        return false; // Failed to create product
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<bool> updateProduct(ProductData product) async {
    try {
      final response = await http.put(
        Uri.parse(
            '$baseUrl/products/${product.id}'), // Use the product ID to update
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(product.toJson()), // Convert object to JSON
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Error: $e");
    }

// Return true if update is successful
  }

  Future<bool> deleteProduct(int id) async {
    try {
      final response = await http.delete(
          Uri.parse('$baseUrl/products/$id')); // Use the product ID to delete
      if (response.statusCode == 200) {
        return true;
      } else {
        return false; // Return false if delete is unsuccessful
      }
    } catch (e) {
      throw Exception("Error:$e");
    }
  }
}
