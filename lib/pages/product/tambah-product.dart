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
              decoration: const InputDecoration(
                labelText: 'Nama*',
                border: OutlineInputBorder(),
              ),
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
                    decoration: const InputDecoration(
                      labelText: 'Stok*',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Kode Barang*',
                          border: OutlineInputBorder(),
                        ),
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
                    decoration: const InputDecoration(
                      labelText: 'Harga Dasar*',
                      border: OutlineInputBorder(),
                      prefixText: 'Rp ',
                    ),
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
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Kategori',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(child: Text('Pilih Kategori'), value: null),
              ],
              onChanged: (value) {
                // Aksi saat kategori dipilih
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
                final kategori = Kategori(
                  id: 1,
                  namaKategori: "Default"
                );
                
                final product = Product(



                  id: null,
                  kode: "123456",
                  namaProduk: "Contoh Barang",
                  harga: 15000.00,
                  stok: 10,




                  gambar: "https://example.com/image.jpg",
                  kategori: kategori,
                );
                
                createProduct(product);
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

void createProduct(Product product) {
}