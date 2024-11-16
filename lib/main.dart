import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/menu_utama.dart';
import 'package:pemrogramanbergerak/product/item_product.dart';


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

class ContohListView extends StatelessWidget {
  const ContohListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contoh List View"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data 1"),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data 2"),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data 3"),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data 4"),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Data 5"),
          ),
        ],
      ),
    );
  }
}
