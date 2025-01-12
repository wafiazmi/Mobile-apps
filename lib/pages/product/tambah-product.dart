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
        title: const Text('Tambah Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _kodeController,
              decoration: const InputDecoration(
                labelText: 'Kode*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama Produk*',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _hargaController,
              decoration: const InputDecoration(
                labelText: 'Harga*',
                border: OutlineInputBorder(),
                prefixText: 'Rp ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _stokController,
              decoration: const InputDecoration(
                labelText: 'Stok*',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
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
            const SizedBox(height: 16),
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
              backgroundColor: Colors.green,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Simpan'),
          ),
          ],
        ),
      ),
    );
  }
}