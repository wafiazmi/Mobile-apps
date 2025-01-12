import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/pages/product/tambah-product.dart';
import 'package:pemrogramanbergerak/pages/product/widget/item_product.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';

class MenuProduct extends StatefulWidget {
  const MenuProduct({super.key});

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  List<Product> products = [];
  final ProductService productService = ProductService();
  bool isLoading = true; // Tambahkan loading state
  String errorMessage = ''; // Tambahkan error state

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Panggil method untuk mengambil data
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

  void _updateProduct(Product updatedProduct) {
    setState(() {
      final index = products.indexWhere((p) => p.id == updatedProduct.id);
      if (index != -1) {
        products[index] = updatedProduct; // Perbarui produk di list
      }
    });
  }

  void _deleteProduct(int productId) {
    setState(() {
      products.removeWhere((p) => p.id == productId); // Hapus produk dari list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Produk",
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Tampilkan loading indicator
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage)) // Tampilkan pesan error
              : Container(
                  color: Colors.grey[200],
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 4,
                          child: ItemProduct(
                            barang: products[index],
                            onProductUpdated: _updateProduct, // Kirim callback ke ItemProduct
                            onProductDeleted: _deleteProduct, // Kirim callback untuk delete
                          ),
                        ),
                      );
                    },
                  ),
                ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahBarangScreen()),
            );
            fetchProducts(); // Refresh data setelah kembali
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text(
            "Add Product",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}