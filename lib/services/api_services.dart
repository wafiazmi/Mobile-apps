import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pemrogramanbergerak/model/user_model.dart';
// import 'package:kasir_pintar_2/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api/v1';
  // final String baseUrl = 'http://127.0.0.1:8000/api/v1';

  // final String baseUrl = 'http://192.168.100.129:8000/api/v1';
  // final String baseUrl = 'http://10.252.25.235:8000/api/v1';

  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'login': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['data']['token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print("Token : $token");
      return token;
    } else {
      throw Exception('Login failed');
    }
  }

  Future<List<User>> getAllPengguna() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/penggunas'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      // body: jsonEncode({'token': 'Bearer $token'}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var ListResult = data['data'];
      List<User> ListUser = [];
      for (var element in ListResult) {
        ListUser.add(
          User(
              email: element['email'],
              name: element['name'],
              id: element['id']),
        );
      }

      return ListUser;
    } else {
      throw Exception('Get Data User Failed');
    }
  }
}