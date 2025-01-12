import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product barang;

  const ProductDetail({Key? key, required this.barang, required productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barang.namaProduk ?? "Nama tidak tersedia"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              barang.namaProduk ?? "Nama tidak tersedia",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Harga: Rp ${barang.harga?.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Kode: ${barang.kode}",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Stok: ${barang.stok}",
              style: const TextStyle(fontSize: 18),
            ),
            if (barang.gambar != null) ...[
              const SizedBox(height: 16),
              Image.network(barang.gambar!),
            ],
            if (barang.kategori != null) ...[
              const SizedBox(height: 16),
              Text(
                "Kategori: ${barang.kategori?.namaKategori}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
            const SizedBox(height: 16),
            const Text(
              "Keterangan:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Informasi tambahan mengenai produk akan ditampilkan di sini.",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Add edit functionality here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Edit Produk',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}