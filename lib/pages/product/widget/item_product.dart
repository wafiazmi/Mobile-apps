import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/product/models/product_model.dart';

class ItemProduct extends StatelessWidget {
   ItemProduct({super.key, required this.barang});
  Product barang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              child: Text("${barang.nama!.substring(0, 2).toUpperCase()}"),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${barang.nama}"),
                      const Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Jumlah 30')),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('${barang.kode_barang}'),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text("${barang.harga_jual}"),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${barang.harga_beli}"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}