import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';
import 'package:pemrogramanbergerak/services/kategori_service.dart'; // Import KategoriService
import 'package:pemrogramanbergerak/pages/kategori-barang/models/kategori_model.dart'; // Import KategoriModel

class TambahBarangScreen extends StatefulWidget {
  const TambahBarangScreen({Key? key}) : super(key: key);

  @override
  _TambahBarangScreenState createState() => _TambahBarangScreenState();
}

class _TambahBarangScreenState extends State<TambahBarangScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  int? _selectedKategori; // Menyimpan ID kategori yang dipilih
  List<KategoriModel> _kategoriList = []; // Menyimpan daftar kategori dari API
  final KategoriService _kategoriService = KategoriService(); // Instance KategoriService

  @override
  void initState() {
    super.initState();
    _loadKategori(); // Memuat data kategori saat screen di-load
  }

  @override
  void dispose() {
    _namaController.dispose();
    _kodeController.dispose();
    _stokController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  // Fungsi untuk memuat data kategori dari API
  Future<void> _loadKategori() async {
    try {
      final kategoriList = await _kategoriService.getKategori();
      setState(() {
        _kategoriList = kategoriList;
        if (_kategoriList.isNotEmpty) {
          _selectedKategori = _kategoriList.first.id; // Set kategori pertama sebagai default
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat kategori: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Barang',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue, // Warna AppBar
        elevation: 0, // Menghilangkan shadow di AppBar
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _kodeController,
                        decoration: InputDecoration(
                          labelText: 'Kode*',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.code),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(
                          labelText: 'Nama Produk*',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.shopping_bag),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _hargaController,
                        decoration: InputDecoration(
                          labelText: 'Harga*',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.attach_money),
                          prefixText: 'Rp ',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _stokController,
                        decoration: InputDecoration(
                          labelText: 'Stok*',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.inventory),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          labelText: 'Kategori',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.category),
                        ),
                        value: _selectedKategori,
                        items: _kategoriList.map((kategori) {
                          return DropdownMenuItem<int>(
                            value: kategori.id,
                            child: Text(kategori.namaKategori ?? ''),
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          setState(() {
                            _selectedKategori = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () async {
                          final product = {
                            "kode": _kodeController.text,
                            "nama_produk": _namaController.text,
                            "harga": _hargaController.text,
                            "stok": int.parse(_stokController.text),
                            "kategori": {
                              "id": _selectedKategori, // Kirim ID kategori
                              "nama_kategori": _kategoriList
                                  .firstWhere((kategori) => kategori.id == _selectedKategori)
                                  .namaKategori, // Kirim nama kategori
                            },
                          };

                          try {
                            await ProductService().createProduct(Product.fromJson(product));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Produk berhasil disimpan')),
                            );
                            Navigator.pop(context);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Gagal menyimpan produk: $e')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}