import 'package:flutter/material.dart';

class StockManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manajemen Stok"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Cari nama atau kode barang",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text("Mo"),
                    backgroundColor: Colors.green.shade100,
                  ),
                  title: Text("mouse"),
                  subtitle: Text("M6152339MX04027\nHrg dasar Rp 100.000"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "8",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Text("Rp 150.000"),
                    ],
                  ),
                  isThreeLine: true,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          title: Container(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height * 0.8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0, horizontal: 16.0),
                                  child: Text(
                                    "AKSI",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            radius: 24,
                                            backgroundColor: Colors.green,
                                            child: Icon(Icons.mouse, color: Colors.white),
                                          ),
                                          title: Text("mouse"),
                                          subtitle: Text("M6152339MX04027"),
                                          trailing: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "Rp 150.000",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Text("8"),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        ListTile(
                                          title: Text("Tambah / kurang stok"),
                                          trailing: Icon(Icons.chevron_right),
                                          onTap: () {
                                            // Tambah stok action
                                          },
                                        ),
                                        ListTile(
                                          title: Text("Edit / lihat stok"),
                                          trailing: Icon(Icons.chevron_right),
                                          onTap: () {
                                            // Edit stok action
                                          },
                                        ),
                                        ListTile(
                                          title: Text("Log Barang"),
                                          trailing: Icon(Icons.chevron_right),
                                          onTap: () {
                                            // Log barang action
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      minimumSize: Size(double.infinity, 48),
                                    ),
                                    child: Text("OK", style: TextStyle(color: Colors.white)),                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}