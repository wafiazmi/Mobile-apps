//lib\pages\services\kategori_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pemrogramanbergerak/pages/kategori-barang/models/kategori_model.dart';

class KategoriService {
  final String baseUrl = 'http://127.0.0.1:8000/api/v1';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

Future<List<KategoriModel>> getKategori() async {
  try {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/kategori'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}'); // Debugging
    print('Response body: ${response.body}'); // Debugging

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> data = responseBody['data'];
      return data.map((json) => KategoriModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load kategori: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

Future<void> addKategori(KategoriModel kategori) async {
  try {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/kategori'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(kategori.toJson()),
    );

    print('Response status: ${response.statusCode}'); // Debugging
    print('Response body: ${response.body}'); // Debugging

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to add kategori: ${response.body}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

 Future<void> deleteKategori(int id) async {
  try {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/kategori/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Response status: ${response.statusCode}'); // Debugging
    print('Response body: ${response.body}'); // Debugging

    if (response.statusCode != 200) {
      throw Exception('Failed to delete kategori: ${response.body}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
}