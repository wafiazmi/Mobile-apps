import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/edit_produk.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product, required Product barang, int? productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProductScreen(product: product),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Logika untuk menghapus produk
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            if (product.gambar != null && product.gambar!.isNotEmpty)
              Center(
                child: Image.network(
                  product.gambar!,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image, size: 150); // Placeholder jika gambar tidak valid
                  },
                ),
              )
            else
              Center(
                child: Icon(Icons.image, size: 150), // Placeholder jika gambar kosong
              ),

            SizedBox(height: 20),

            // Nama Produk
            Text(
              product.namaProduk ?? 'Nama Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Harga Jual
            Text(
              'Harga Jual: Rp ${product.harga?.toStringAsFixed(2) ?? '0.00'}',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 10),

            // Diskon
            Text(
              'Diskon: 0.0%', // Anda bisa menambahkan field diskon di model jika diperlukan
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Berat
            Text(
              'Berat: 0.0 gram', // Anda bisa menambahkan field berat di model jika diperlukan
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Kode Produk
            Text(
              'Kode: ${product.kode ?? '-'}',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Stok
            Text(
              'Stok: ${product.stok != null ? (product.stok! >= 0 ? product.stok.toString() : 'Tidak terbatas') : '-'}',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Stok Minimum
            Text(
              'Stok Minimum: 0.0', // Anda bisa menambahkan field stok minimum di model jika diperlukan
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Kategori
            Text(
              'Kategori: ${product.kategori?.namaKategori ?? '-'}',
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 10),

            // Letak Rak
            Text(
              'Letak Rak: -', // Anda bisa menambahkan field letak rak di model jika diperlukan
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            // Keterangan
            Text(
              'Keterangan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Tidak ada keterangan', // Anda bisa menambahkan field keterangan di model jika diperlukan
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 20),

            // Tombol Lihat Barang Terhubung
            ElevatedButton(
              onPressed: () {
                // Logika untuk melihat barang terhubung
              },
              child: Text('Lihat Barang Terhubung'),
            ),

            SizedBox(height: 10),

            // Tombol Detail Sisa Stok
            ElevatedButton(
              onPressed: () {
                // Logika untuk melihat detail sisa stok
              },
              child: Text('Detail Sisa Stok'),
            ),

            SizedBox(height: 10),

            // Tombol Pelanggan
            ElevatedButton(
              onPressed: () {
                // Logika untuk melihat pelanggan
              },
              child: Text('Pelanggan'),
            ),

            SizedBox(height: 10),

            // Tombol Supplier
            ElevatedButton(
              onPressed: () {
                // Logika untuk melihat supplier
              },
              child: Text('Supplier'),
            ),
          ],
        ),
      ),
    );
  }
}