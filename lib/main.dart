import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/kategori-barang/kategori_barang.dart';
import 'package:pemrogramanbergerak/manajemen-stok/pop-up.dart';
import 'package:pemrogramanbergerak/pages/login/login_page.dart';
import 'package:pemrogramanbergerak/pages/profile/foto.dart';
import 'package:pemrogramanbergerak/pages/menu_utama.dart';
import 'package:pemrogramanbergerak/pages/profile/edit_profile.dart';
import 'package:pemrogramanbergerak/pages/profile/profile.dart';
import 'package:pemrogramanbergerak/pages/product/widget/item_product.dart';

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
