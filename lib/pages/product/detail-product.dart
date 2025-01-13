import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/edit_produk.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  final Product barang;
  final int? productId;
  final Function(Product)? onProductUpdated;
  final Function(int)? onProductDeleted; // Callback untuk menghapus produk

  const ProductDetail({
    Key? key,
    required this.product,
    required this.barang,
    this.productId,
    this.onProductUpdated,
    this.onProductDeleted, // Tambahkan parameter callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductService productService = ProductService();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.namaProduk ?? "Detail Produk",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card untuk menampilkan detail produk
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Produk",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildDetailRow("Nama Produk", product.namaProduk ?? "N/A"),
                    _buildDetailRow("Stok", "${product.stok ?? 0}"),
                    _buildDetailRow("Harga", "Rp ${product.harga ?? 0}"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Edit dan Hapus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
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
                  icon: Icon(Icons.edit, color: Colors.white),
                  label: Text(
                    "Edit Produk",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
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
                    ) ?? false;

                    if (confirmDelete) {
                      try {
                        final success = await productService.deleteProduct(product.id!);
                        if (success) {
                          if (onProductDeleted != null) {
                            onProductDeleted!(product.id!); // Panggil callback untuk menghapus produk dari list
                          }
                          Navigator.pop(context); // Kembali ke halaman sebelumnya
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
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text(
                    "Hapus Produk",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan detail dalam bentuk baris
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent[700],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}