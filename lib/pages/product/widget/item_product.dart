import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/pages/product/detail-product.dart';

class ItemProduct extends StatelessWidget {
  final Product barang;
  final Function(Product)? onProductUpdated; // Callback untuk memperbarui produk

  const ItemProduct({
    Key? key,
    required this.barang,
    this.onProductUpdated, // Tambahkan parameter callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(barang.namaProduk ?? "Nama tidak tersedia"),
      subtitle: Text("Stok: ${barang.stok ?? 0}"),
      trailing: Text("Rp ${barang.harga ?? 0}"),
      onTap: () async {
        // Navigasi ke halaman detail produk
        final updatedProduct = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              product: barang,
              barang: barang,
              productId: barang.id,
              onProductUpdated: onProductUpdated, // Kirim callback ke ProductDetail
            ),
          ),
        );

        // Jika ada produk yang diperbarui, panggil callback
        if (updatedProduct != null && onProductUpdated != null) {
          onProductUpdated!(updatedProduct);
        }
      },
    );
  }
}