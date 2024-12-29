import 'package:flutter/material.dart';
import 'product_service.dart';
import 'package:pemrogramanbergerak/pages/product/detail-product.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final ProductService _productService = ProductService();
  late Future<List<dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = _productService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: FutureBuilder<List<dynamic>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No products available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ListTile(
                  title: Text(product['nama_produk']),
                  subtitle: Text('Stok: ${product['stok']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(productId: product['id'], barang: product),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}