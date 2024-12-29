import 'package:flutter/material.dart';
import 'product_service.dart';

class ProductDetail extends StatelessWidget {
  final int productId;
  final ProductService _productService = ProductService();

  ProductDetail({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Detail')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _productService.getProductDetail(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Product not found.'));
          } else {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: ${product['nama_produk']}'),
                  Text('Kode: ${product['kode']}'),
                  Text('Harga: ${product['harga']}'),
                  Text('Stok: ${product['stok']}'),
                  Text('Kategori: ${product['kategori']['nama']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
