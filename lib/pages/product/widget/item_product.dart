import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/pages/product/detail-product.dart';

class ItemProduct extends StatelessWidget {
  final Product barang;

  const ItemProduct({Key? key, required this.barang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(barang.namaProduk ?? "Nama tidak tersedia"),
      subtitle: Text("Stok: ${barang.stok ?? 0}"),
      trailing: Text("Rp ${barang.harga ?? 0}"),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(barang: barang, productId: barang.id),
          ),
        );
      },
    );
  }
}