import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';
import 'package:pemrogramanbergerak/pages/product/tambah-product.dart';
import 'package:pemrogramanbergerak/pages/product/widget/item_product.dart';

// import 'package:praktikum_list_view/pages/product/item_product.dart';

class MenuProduct extends StatefulWidget {
  const MenuProduct({super.key});

  @override
  State<MenuProduct> createState() => _MenuProductState();
}

class _MenuProductState extends State<MenuProduct> {
  List products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  void setData() {
    products = [
      Product(
        nama: "Beng Beng",
        harga_beli: 1500,
        harga_jual: 3000,
        kode_barang: "KSR00001",
        stok: 15,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Taro Snack",
        harga_beli: 2000,
        harga_jual: 4000,
        kode_barang: "KSR00002",
        stok: 8,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Good Time Choco Chip",
        harga_beli: 5000,
        harga_jual: 6500,
        kode_barang: "KSR00003",
        stok: 12,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Indomie Goreng",
        harga_beli: 2500,
        harga_jual: 3000,
        kode_barang: "KSR00004",
        stok: 20,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Nutella Spread",
        harga_beli: 25000,
        harga_jual: 35000,
        kode_barang: "KSR00005",
        stok: 3,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Aqua 600ml",
        harga_beli: 3000,
        harga_jual: 4000,
        kode_barang: "KSR00006",
        stok: 50,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Pringles Original",
        harga_beli: 20000,
        harga_jual: 25000,
        kode_barang: "KSR00007",
        stok: 6,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Oreo Wafer Roll",
        harga_beli: 7000,
        harga_jual: 9000,
        kode_barang: "KSR00008",
        stok: 10,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Yakult",
        harga_beli: 8500,
        harga_jual: 10000,
        kode_barang: "KSR00009",
        stok: 7,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Pocky Strawberry",
        harga_beli: 5500,
        harga_jual: 8000,
        kode_barang: "KSR00010",
        stok: 15,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Chitato Rasa Sapi Panggang",
        harga_beli: 5000,
        harga_jual: 7500,
        kode_barang: "KSR00011",
        stok: 18,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Coca Cola 1L",
        harga_beli: 8000,
        harga_jual: 10000,
        kode_barang: "KSR00012",
        stok: 25,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "SilverQueen Cashew",
        harga_beli: 12000,
        harga_jual: 15000,
        kode_barang: "KSR00013",
        stok: 10,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Lays Classic",
        harga_beli: 11000,
        harga_jual: 13000,
        kode_barang: "KSR00014",
        stok: 4,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Teh Kotak Jasmine",
        harga_beli: 4000,
        harga_jual: 6000,
        kode_barang: "KSR00015",
        stok: 30,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Fanta Grape",
        harga_beli: 7000,
        harga_jual: 9000,
        kode_barang: "KSR00016",
        stok: 22,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Pepsi Blue",
        harga_beli: 7500,
        harga_jual: 9500,
        kode_barang: "KSR00017",
        stok: 17,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Milo Kotak",
        harga_beli: 5000,
        harga_jual: 7000,
        kode_barang: "KSR00018",
        stok: 40,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Kacang Garuda",
        harga_beli: 3000,
        harga_jual: 5000,
        kode_barang: "KSR00019",
        stok: 35,
        uri_gambar: "",
        id_kategori: 1,
      ),
      Product(
        nama: "Torabika Cappuccino",
        harga_beli: 2000,
        harga_jual: 3500,
        kode_barang: "KSR00020",
        stok: 60,
        uri_gambar: "",
        id_kategori: 1,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Produk",
          style: TextStyle(
            fontSize: 24,
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: ItemProduct(
                  barang: products[index],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahBarangScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text(
            "Add Product",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}