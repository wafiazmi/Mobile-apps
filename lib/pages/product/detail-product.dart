import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/edit_produk.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  final Product barang;
  final int? productId;
  final Function(Product)? onProductUpdated;
  final Function(int)? onProductDeleted;

  const ProductDetail({
    Key? key,
    required this.product,
    required this.barang,
    this.productId,
    this.onProductUpdated,
    this.onProductDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductService productService = ProductService();

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
                final updatedProduct = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductScreen(
                      product: product,
                      onProductUpdated: onProductUpdated,
                    ),
                  ),
                );

                if (updatedProduct != null && onProductUpdated != null) {
                  onProductUpdated!(updatedProduct);
                }
              },
              child: Text("Edit Produk"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
  final confirmDelete = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Hapus Produk"),
      content: Text("Apakah Anda yakin ingin menghapus produk ini?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text("Batal"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text("Hapus"),
        ),
      ],
    ),
  ) ?? false; // Default ke false jika null

  if (confirmDelete) {
    try {
      final success = await productService.deleteProduct(product.id!);
      if (success) {
        if (onProductDeleted != null) { // Perbaikan di sini
          onProductDeleted!(product.id!);
        }
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal menghapus produk")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menghapus produk: $e")),
      );
    }
  }
},
              child: Text("Hapus Produk"),
            ),
          ],
        ),
      ),
    );
  }
}