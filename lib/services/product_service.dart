//lib\services\product_service.dart
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ProductService {
  final String baseUrl = 'http://127.0.0.1:8000/api/v1/produk';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<List<Product>> getProducts() async {
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final List<dynamic> data = responseBody['data'];
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timeout: $e');
    } on http.ClientException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Product> getProductDetail(int id) async {
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body)['data'];
        return Product.fromJson(data);
      } else {
        throw Exception(
            'Failed to load product detail: ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timeout: $e');
    } on http.ClientException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> createProduct(Product product) async {
    try {
      final token = await _getToken();
      final response = await http
          .post(
            Uri.parse(baseUrl),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              "id": product.id,
              "kode": product.kode,
              "nama_produk": product.namaProduk,
              "harga": product.harga?.toString(),
              "stok": product.stok,
              "gambar": product.gambar,
              "kategori": product.kategori?.toJson(),
            }),
          )
          .timeout(Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create product: ${response.body}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timeout: $e');
    } on http.ClientException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

    Future<bool> updateProduct(Product product) async {
    try {
      final token = await _getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/${product.id}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(product.toJson()),
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update product. Status code: ${response.statusCode}, Response: ${response.body}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timeout: $e');
    } on http.ClientException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}

  Future<Map<String, dynamic>> deleteProduct(int id, dynamic ApiConfig) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      final response = await http.delete(
        Uri.parse('${ApiConfig.baseUrl}/produk/$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to delete product: ${response.body}');
      }
    } on TimeoutException catch (e) {
      throw Exception('Request timeout: $e');
    } on http.ClientException catch (e) {
      throw Exception('Network error: $e');
    } on FormatException catch (e) {
      throw Exception('Invalid JSON format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

