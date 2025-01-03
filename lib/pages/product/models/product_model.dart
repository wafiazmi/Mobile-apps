class Product {
  int? id_product;
  String? nama;
  String? kode_barang;
  int? stok;
  int? harga_beli;
  int? harga_jual;
  String? uri_gambar;
  String? harga_satuan;
  int? id_kategori;

  Product({
    this.id_product,
    this.nama = 'Barang 1',
    this.kode_barang = '0000001',
    this.stok = 10,
    this.harga_beli = 10000,
    this.harga_jual = 5000,
    required uri_gambar,
    required id_kategori,
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
}
