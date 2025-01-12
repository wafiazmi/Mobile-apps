import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/kategori-barang/kategori_barang.dart';
import 'package:pemrogramanbergerak/pages/login/login_page.dart';
import 'package:pemrogramanbergerak/pages/profile/foto.dart';
import 'package:pemrogramanbergerak/pages/menu_utama.dart';
import 'package:pemrogramanbergerak/pages/profile/edit_profile.dart';
import 'package:pemrogramanbergerak/pages/profile/profile.dart';
import 'package:pemrogramanbergerak/pages/product/widget/item_product.dart';
<<<<<<< HEAD
import 'package:pemrogramanbergerak/pages/pembelian/pembelian_page.dart';
=======
import 'package:pemrogramanbergerak/pages/login/register.dart';

>>>>>>> 48e5da6587bc422e4961b67d9fae42c5a9606115

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage());
  }
}
