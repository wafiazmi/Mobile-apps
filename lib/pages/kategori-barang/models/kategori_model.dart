//lib\pages\kategori-barang\models\kategori_model.dart
class KategoriModel {
  int? id;
  String? namaKategori;
  int? idToko;

  KategoriModel({
    this.id,
    this.namaKategori,
    this.idToko,
  });

  factory KategoriModel.fromJson(Map<String, dynamic> json) {
    return KategoriModel(
      id: json['id'],
      namaKategori: json['nama_kategori'],
      idToko: json['id_toko'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama_kategori": namaKategori,
      "id_toko": idToko,
    };
  }
}