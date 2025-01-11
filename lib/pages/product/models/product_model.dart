class Product {
  int? id_product;
  String? nama;
  String? kode_barang;
  int? stok;
  int? harga_beli;
  int? harga_jual;
  String? uri_gambar;
  int? id_kategori;

  Product({
    this.id_product,
    this.nama,
    this.kode_barang,
    this.stok,
    this.harga_beli,
    this.harga_jual,
    this.uri_gambar,
    this.id_kategori,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id_product: json['id_product'],
      nama: json['nama'],
      kode_barang: json['kode_barang'],
      stok: json['stok'],
      harga_beli: json['harga_beli'],
      harga_jual: json['harga_jual'],
      uri_gambar: json['uri_gambar'],
      id_kategori: json['id_kategori'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id_product": id_product,
      "nama": nama,
      "kode_barang": kode_barang,
      "stok": stok,
      "harga_beli": harga_beli,
      "harga_jual": harga_jual,
      "uri_gambar": uri_gambar,
      "id_kategori": id_kategori,
    };
  }
}