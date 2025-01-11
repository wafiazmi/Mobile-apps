import 'dart:async'; // Impor library ini
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ProductService {
  final String baseUrl = 'http://127.0.0.1:8000/api/v1/produk'; // Ganti dengan URL API Anda

  // Method untuk mengambil token dari SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Method untuk mengambil semua produk
  Future<List<Product>> getProducts() async {
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10)); // Tambahkan timeout

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
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

  // Method untuk mengambil detail produk berdasarkan ID
  Future<Product> getProductDetail(int id) async {
    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10)); // Tambahkan timeout

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body)['data'];
        return Product.fromJson(data);
      } else {
        throw Exception('Failed to load product detail: ${response.statusCode}');
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

  // Method untuk menambahkan produk baru
  Future<Map<String, dynamic>> createProduct(Product product) async {
    try {
      final token = await _getToken();
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          "id_product": product.id_product,
          "nama": product.nama,
          "kode_barang": product.kode_barang,
          "stok": product.stok,
          "harga_beli": product.harga_beli,
          "harga_jual": product.harga_jual,
          "uri_gambar": product.uri_gambar,
          "id_kategori": product.id_kategori,
        }),
      ).timeout(Duration(seconds: 10)); // Tambahkan timeout

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

  // Method untuk mengupdate produk berdasarkan ID
  Future<Map<String, dynamic>> updateProduct(int id, Map<String, dynamic> data) async {
    try {
      final token = await _getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      ).timeout(Duration(seconds: 10)); // Tambahkan timeout

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update product: ${response.body}');
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

  // Method untuk menghapus produk berdasarkan ID
  Future<Map<String, dynamic>> deleteProduct(int id) async {
    try {
      final token = await _getToken();
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      ).timeout(Duration(seconds: 10)); // Tambahkan timeout

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
}