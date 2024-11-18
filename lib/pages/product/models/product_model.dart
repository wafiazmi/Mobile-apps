class Product {
  int? id_product;
  String? nama;
  String? kode_barang;
  int? stok;
  int? harga_beli;
  int? harga_jual;
  String? uri_gambar;
  String? satuan;
  int? id_kategori;

  Product({
    this.id_product,
    this.nama = 'Barang 1',
    this.kode_barang = '0000001',
    this.stok = 10,
    this.harga_beli = 10000,
    this.harga_jual = 5000,
  });
}
