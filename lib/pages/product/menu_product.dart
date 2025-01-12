import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/detail-product.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/pages/product/tambah-product.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';

class MenuProduct extends StatefulWidget {
  const MenuProduct({super.key});

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  List<Product> products = [];
  final ProductService productService = ProductService();
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Ambil data produk saat pertama kali dibuka
  }

  Future<void> fetchProducts() async {
    try {
      final data = await productService.getProducts();
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Gagal memuat data: $e';
        isLoading = false;
      });
    }
  }

  void _deleteProduct(int productId) {
    setState(() {
      products.removeWhere((product) => product.id == productId); // Hapus produk dari list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Daftar Produk",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blueAccent.shade100, Colors.white],
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16.0),
                            leading: Icon(
                              Icons.shopping_bag,
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                            title: Text(
                              products[index].namaProduk ?? "N/A",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  "Stok: ${products[index].stok ?? 0}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Text(
                                  "Harga: Rp ${products[index].harga ?? 0}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blueAccent,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    product: products[index],
                                    barang: products[index],
                                    productId: products[index].id,
                                    onProductDeleted: _deleteProduct, // Kirim callback ke ProductDetail
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahBarangScreen()),
          );
          fetchProducts(); // Refresh data setelah kembali
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
    );
  }
}