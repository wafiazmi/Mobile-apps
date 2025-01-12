import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/services/product_service.dart';
import 'package:pemrogramanbergerak/pages/profile/foto.dart';

class TambahBarangScreen extends StatefulWidget {
  const TambahBarangScreen({Key? key}) : super(key: key);

  @override
  _TambahBarangScreenState createState() => _TambahBarangScreenState();
}

class _TambahBarangScreenState extends State<TambahBarangScreen> {
  bool tampilkanDiTransaksi = true;
  bool pakaiStok = true;

  // Controller untuk input fields
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _stokController = TextEditingController();
  final TextEditingController _hargaController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();

  // State untuk kategori
  Kategori? _selectedKategori;

  @override
  void dispose() {
    // Hapus controller saat widget di-dispose
    _namaController.dispose();
    _kodeController.dispose();
    _stokController.dispose();
    _hargaController.dispose();
    _gambarController.dispose();
    super.dispose();
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
        actions: [
          TextButton.icon(
            onPressed: () {
              // Aksi tombol "Instant"
            },
            icon: const Icon(Icons.add_circle, color: Colors.orange),
            label: const Text(
              '+ Instan',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.image, color: Colors.green),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Builder) => const Foto()));
                  },
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.green),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (Builder) => const Foto()));
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                labelText: 'Nama*',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama produk tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Tipe Barang',
                border: OutlineInputBorder(),
              ),
              value: 'Default',
              items: const [
                DropdownMenuItem(child: Text('Default'), value: 'Default'),
              ],
              onChanged: (value) {
                // Aksi saat tipe barang dipilih
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: tampilkanDiTransaksi,
                  onChanged: (bool? value) {
                    setState(() {
                      tampilkanDiTransaksi = value ?? false;
                    });
                  },
                ),
                const Text('Tampilkan di Transaksi'),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: pakaiStok,
                  onChanged: (bool? value) {
                    setState(() {
                      pakaiStok = value ?? false;
                    });
                  },
                ),
                const Text('Pakai Stok'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _stokController,
                    decoration: const InputDecoration(
                      labelText: 'Stok*',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Stok tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        controller: _kodeController,
                        decoration: const InputDecoration(
                          labelText: 'Kode Barang*',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kode barang tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      Positioned(
                        right: 4,
                        child: IconButton(
                          icon: const Icon(Icons.sync, color: Colors.green),
                          onPressed: () {
                            // Aksi tombol sync
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _hargaController,
                    decoration: const InputDecoration(
                      labelText: 'Harga Dasar*',
                      border: OutlineInputBorder(),
                      prefixText: 'Rp ',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga dasar tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Harga Jual*',
                      border: OutlineInputBorder(),
                      prefixText: 'Rp ',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Harga jual tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Kategori>(
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              value: _selectedKategori,
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text('Pilih Kategori'),
                ),
                // Contoh daftar kategori (bisa diganti dengan data dari API)
                DropdownMenuItem(
                  value: Kategori(id: 1, namaKategori: 'Makanan'),
                  child: Text('Makanan'),
                ),
                DropdownMenuItem(
                  value: Kategori(id: 2, namaKategori: 'Minuman'),
                  child: Text('Minuman'),
                ),
              ],
              onChanged: (Kategori? value) {
                setState(() {
                  _selectedKategori = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: InkWell(
                onTap: () {
                  // Aksi tampilkan lebih banyak
                },
                child: const Text(
                  'Tampilkan Lebih Banyak',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Validasi input
                if (_namaController.text.isEmpty ||
                    _kodeController.text.isEmpty ||
                    _stokController.text.isEmpty ||
                    _hargaController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Harap isi semua field yang wajib diisi')),
                  );
                  return;
                }

                // Buat objek Product
                final product = Product(
                  id: null, // ID akan di-generate oleh backend
                  kode: _kodeController.text,
                  namaProduk: _namaController.text,
                  harga: double.tryParse(_hargaController.text),
                  stok: int.tryParse(_stokController.text),
                  gambar: _gambarController.text,
                  kategori: _selectedKategori,
                );

                // Panggil fungsi untuk menyimpan produk
                createProduct(product);

                // Tampilkan pesan sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Produk berhasil disimpan')),
                );

                // Kembali ke halaman sebelumnya
                Navigator.pop(context);
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

void createProduct(Product product) async {
  final productService = ProductService();
  try {
    await productService.createProduct(product);
  } catch (e) {
    print('Gagal menyimpan produk: $e');
  }
}