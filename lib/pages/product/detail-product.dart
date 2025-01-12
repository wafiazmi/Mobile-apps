import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/edit_produk.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  final Product barang;
  final int? productId;
  final Function(Product)? onProductUpdated; // Callback untuk memperbarui produk

  const ProductDetail({
    Key? key,
    required this.product,
    required this.barang,
    this.productId,
    this.onProductUpdated, // Tambahkan parameter callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.namaProduk ?? "Detail Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama Produk: ${product.namaProduk ?? "N/A"}"),
            Text("Stok: ${product.stok ?? 0}"),
            Text("Harga: Rp ${product.harga ?? 0}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigasi ke halaman edit produk
                final updatedProduct = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductScreen(
                      product: product,
                      onProductUpdated: onProductUpdated, // Kirim callback ke EditProductScreen
                    ),
                  ),
                );

                // Jika ada produk yang diperbarui, panggil callback
                if (updatedProduct != null && onProductUpdated != null) {
                  onProductUpdated!(updatedProduct);
                }
              },
              child: Text("Edit Produk"),
            ),
          ],
        ),
      ),
    );
  }
}