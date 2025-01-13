//lib\pages\kategori-barang\kategori_barang.dart
import 'package:flutter/material.dart';                                                   //  Paket utama untuk membangun UI Flutter.
import 'package:pemrogramanbergerak/pages/kategori-barang/models/kategori_model.dart';    // berisi model data kategori untuk mempermudah manipulasi data.
import 'package:pemrogramanbergerak/services/kategori_service.dart';                      // berkomunikasi dengan API terkait kategori.

class Kategori extends StatefulWidget {           // Kategori: Sebuah widget stateful yang akan menampilkan halaman kategori.
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();   // _KategoriState: State dari widget yang menangani logika dan pembaruan UI.
}

class _KategoriState extends State<Kategori> {
  final KategoriService _kategoriService = KategoriService(); // Instance dari KategoriService untuk mengakses API kategori.
  late Future<List<KategoriModel>> _futureKategori; // Objek Future yang digunakan untuk menyimpan data kategori dari API.

  @override
  void initState() {
    super.initState();
    _futureKategori = _kategoriService.getKategori();   // initState: Memanggil fungsi getKategori dari KategoriService untuk mendapatkan data kategori saat halaman dimuat.
  }

  // Fungsi untuk menampilkan dialog tambah kategori
  void _showTambahKategoriDialog(BuildContext context) {
    final TextEditingController _namaController = TextEditingController();    // TextEditingController: Mengontrol input teks dari pengguna untuk nama kategori.

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(   // Komponen dialog dengan judul, input teks, dan tombol aksi.
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Center(
            child: Text(
              'TAMBAH KATEGORI',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Kategori',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'BATAL',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      final kategori = KategoriModel(
                        namaKategori: _namaController.text,
                        idToko: 1, // Ganti dengan ID toko yang sesuai
                      );

                      try {
                        await _kategoriService.addKategori(kategori);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Kategori berhasil ditambahkan')),
                        );
                        setState(() {
                          _futureKategori = _kategoriService.getKategori(); // Refresh data
                        });
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Gagal menambahkan kategori: $e')),
                        );
                      }
                    },
                    child: const Text(
                      'SIMPAN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Fungsi untuk menampilkan dialog hapus kategori
  void _showHapusKategoriDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Apakah Anda yakin ingin menghapus kategori ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('BATAL'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await _kategoriService.deleteKategori(id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kategori berhasil dihapus')),
                  );
                  setState(() {
                    _futureKategori = _kategoriService.getKategori(); // Refresh data
                  });
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gagal menghapus kategori: $e')),
                  );
                }
              },
              child: const Text('HAPUS'),  // HAPUS: Memanggil fungsi deleteKategori dari KategoriService untuk menghapus kategori berdasarkan ID.
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // AppBar: Menampilkan header halaman dengan tombol kembali.
        title: const Text('Kategori Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField( // TextField: Input pencarian kategori dengan ikon pencarian.
              decoration: InputDecoration(
                labelText: 'Cari Kategori',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<KategoriModel>>(  // FutureBuilder: Widget yang menampilkan data kategori dari API.
                future: _futureKategori, // 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) { // ConnectionState.waiting: Menampilkan loading spinner saat data belum selesai dimuat.
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) { // snapshot.hasError: Menampilkan pesan error jika terjadi kesalahan.
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) { // snapshot.hasData: Menampilkan daftar kategori jika data tersedia atau tidak ada data.
                    return const Center(child: Text('Tidak ada data kategori'));
                  } else {
                    final kategoriList = snapshot.data!;
                    return ListView.builder(
                      itemCount: kategoriList.length,
                      itemBuilder: (context, index) {
                        final kategori = kategoriList[index];
                        return ListTile(
                          title: Text(kategori.namaKategori ?? ''),
                          subtitle: const Text('Sisa : 8\nModal : Rp 800.000'), // Sesuaikan dengan data yang ada
                          isThreeLine: true,
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _showHapusKategoriDialog(context, kategori.id!);
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding( // elevatedButton: Tombol untuk membuka dialog tambah kategori.
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            _showTambahKategoriDialog(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.green,
          ),
          child: const Text(
            'TAMBAH KATEGORI',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}