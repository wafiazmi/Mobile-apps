class Product {
  int? id;
  String? kode;
  String? namaProduk;
  double? harga; // Ubah ke double karena harga adalah string dalam format "9000.00"
  int? stok;
  String? gambar;
  Kategori? kategori; // Ubah ke objek Kategori

  Product({
    this.id,
    this.kode,
    this.namaProduk,
    this.harga,
    this.stok,
    this.gambar,
    this.kategori,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      kode: json['kode'],
      namaProduk: json['nama_produk'],
      harga: double.tryParse(json['harga']), // Konversi string ke double
      stok: json['stok'],
      gambar: json['gambar'],
      kategori: json['kategori'] != null ? Kategori.fromJson(json['kategori']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kode": kode,
      "nama_produk": namaProduk,
      "harga": harga?.toString(), // Konversi double ke string
      "stok": stok,
      "gambar": gambar,
      "kategori": kategori?.toJson(),
    };
  }
}

class Kategori {
  int? id;
  String? namaKategori;

  Kategori({
    this.id,
    this.namaKategori,
  });

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return Kategori(
      id: json['id'],
      namaKategori: json['nama_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nama_kategori": namaKategori,
    };
  }
}