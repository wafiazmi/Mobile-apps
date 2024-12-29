import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://127.0.0.1:8000/api/v1'; // Ganti dengan URL API Anda

  Future<List<dynamic>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Map<String, dynamic>> getProductDetail(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else {
        throw Exception('Failed to load product detail');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> createProduct(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to create product');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> updateProduct(int id, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      if (response.statusCode != 200) {
        throw Exception('Failed to update product');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode != 200) {
        throw Exception('Failed to delete product');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
