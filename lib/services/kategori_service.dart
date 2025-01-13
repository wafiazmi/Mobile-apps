//lib\pages\services\kategori_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';  // shared_preferences: Untuk menyimpan dan mengambil data lokal, seperti token autentikasi.
import 'package:pemrogramanbergerak/pages/kategori-barang/models/kategori_model.dart';

class KategoriService { // KategoriService: Sebuah kelas yang bertanggung jawab untuk mengambil data kategori dari API.
  final String baseUrl = 'http://127.0.0.1:8000/api/v1';  // baseUrl: URL dasar dari API. Dalam hal ini, API berjalan secara lokal di port 8000

  Future<String?> _getToken() async { // // Mengambil token autentikasi yang disimpan di SharedPreferences.
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

Future<List<KategoriModel>> getKategori() async { // Mendapatkan daftar kategori dari API
  try {
    final token = await _getToken();  // Memanggil _getToken untuk mendapatkan token autentikasi.
    final response = await http.get(
      Uri.parse('$baseUrl/kategori'),
      headers: {
        'Authorization': 'Bearer $token', // Mengirim permintaan GET ke endpoint /kategori dengan header Authorization
      },
    );

    print('Response status: ${response.statusCode}'); // Debugging
    print('Response body: ${response.body}'); // Debugging

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      final List<dynamic> data = responseBody['data'];
      return data.map((json) => KategoriModel.fromJson(json)).toList(); // Jika berhasil, data JSON diubah menjadi daftar objek KategoriModel menggunakan fromJson.
    } else {
      throw Exception('Failed to load kategori: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}

Future<void> addKategori(KategoriModel kategori) async {  // Menambahkan kategori baru ke API.
  try {
    final token = await _getToken();
    final response = await http.post( // Mengirim permintaan POST ke endpoint /kategori dengan:
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

 Future<void> deleteKategori(int id) async {  //  Menghapus kategori berdasarkan ID.
  try {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse('$baseUrl/kategori/$id'),
      headers: {
        'Authorization': 'Bearer $token', // Mengirim permintaan DELETE ke endpoint /kategori/{id} dengan header Authorization.
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