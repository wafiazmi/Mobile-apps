import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/menu_utama.dart';
import 'package:pemrogramanbergerak/pages/profile.dart';
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
      home: MenuUtama(),
    );
  }
}


  