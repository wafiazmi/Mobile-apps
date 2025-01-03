import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/pengguna/models/user_model.dart';
import 'package:pemrogramanbergerak/services/api_services.dart';
// import 'package:kasir_pintar_2/model/user_model.dart';
// import 'package:kasir_pintar_2/services/api_services.dart';

class PenggunaPage extends StatefulWidget {
  const PenggunaPage({super.key});

  @override
  State<PenggunaPage> createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  final ApiService apiService = ApiService();
  List<User> userList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getAllPengguna();
    // setState(() {
    //   userList;
    // });
  }

  getAllPengguna() async {
    userList = await apiService.getAllPengguna();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pengguna"),
        ),
        body: FutureBuilder(
          future: getAllPengguna(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(userList[index].id!.toString()),
                  title: Text(userList[index].name!),
                  subtitle: Text(userList[index].email),
                );
              },
            );
          },
        ));
  }
}
