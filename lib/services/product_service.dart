import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  Future<void> createProduct(Product product) async {
  try {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-Type': 'application/json',
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
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Produk berhasil ditambahkan!");
    } else {
      print("Gagal menambah produk: ${response.body}");
    }
  } catch (e) {
    print("Terjadi kesalahan: $e");
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
