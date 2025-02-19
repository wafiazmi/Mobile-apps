import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;
  final Function(Product)? onProductUpdated; // Callback untuk mengirim data yang diperbarui

  const EditProductScreen({
    Key? key,
    required this.product,
    this.onProductUpdated, // Tambahkan parameter callback
  }) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final ProductService _productService = ProductService(); // Tambahkan ProductService
  late TextEditingController _namaProdukController;
  late TextEditingController _kodeController;
  late TextEditingController _hargaController;
  late TextEditingController _stokController;
  late TextEditingController _kategoriController;

  @override
  void initState() {
    super.initState();
    _namaProdukController = TextEditingController(text: widget.product.namaProduk);
    _kodeController = TextEditingController(text: widget.product.kode);
    _hargaController = TextEditingController(text: widget.product.harga?.toString());
    _stokController = TextEditingController(text: widget.product.stok?.toString());
    _kategoriController = TextEditingController(text: widget.product.kategori?.namaKategori);
  }

  @override
  void dispose() {
    _namaProdukController.dispose();
    _kodeController.dispose();
    _hargaController.dispose();
    _stokController.dispose();
    _kategoriController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Produk',
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card untuk Form Edit Produk
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Nama Produk
                      TextFormField(
                        controller: _namaProdukController,
                        decoration: InputDecoration(
                          labelText: 'Nama Produk*',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.shopping_bag, color: Colors.blueAccent),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama produk tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Kode Produk
                      TextFormField(
                        controller: _kodeController,
                        decoration: InputDecoration(
                          labelText: 'Kode*',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.code, color: Colors.blueAccent),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kode tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Harga Jual
                      TextFormField(
                        controller: _hargaController,
                        decoration: InputDecoration(
                          labelText: 'Harga*',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.attach_money, color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harga tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Stok
                      TextFormField(
                        controller: _stokController,
                        decoration: InputDecoration(
                          labelText: 'Stok*',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.inventory, color: Colors.blueAccent),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Stok tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),

                      // Kategori
                      TextFormField(
                        controller: _kategoriController,
                        decoration: InputDecoration(
                          labelText: 'Kategori',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category, color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(height: 16),

                      // Checkbox Tampilkan di Transaksi
                      Row(
                        children: [
                          Checkbox(
                            value: true, // Sesuaikan dengan nilai dari produk
                            onChanged: (value) {
                              // Logika untuk mengubah nilai
                            },
                          ),
                          Text('Tampilkan di Transaksi'),
                        ],
                      ),

                      // Checkbox Pakai Stok
                      Row(
                        children: [
                          Checkbox(
                            value: true, // Sesuaikan dengan nilai dari produk
                            onChanged: (value) {
                              // Logika untuk mengubah nilai
                            },
                          ),
                          Text('Pakai Stok'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Tombol Simpan
              Center(
                child: ElevatedButton.icon(
                  onPressed: _saveProduct,
                  icon: Icon(Icons.save, color: Colors.white),
                  label: Text(
                    'Simpan',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProduct() async {
    if (_formKey.currentState!.validate()) {
      final updatedProduct = Product(
        id: widget.product.id,
        kode: _kodeController.text,
        namaProduk: _namaProdukController.text,
        harga: double.tryParse(_hargaController.text),
        stok: int.tryParse(_stokController.text),
        kategori: Kategori(
          id: widget.product.kategori?.id,
          namaKategori: _kategoriController.text,
        ),
      );

      try {
        final success = await _productService.updateProduct(updatedProduct);

        if (success) {
          // Panggil callback jika ada
          if (widget.onProductUpdated != null) {
            widget.onProductUpdated!(updatedProduct);
          }
          Navigator.pop(context, updatedProduct); // Kembali ke halaman sebelumnya
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Gagal mengupdate produk')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}