import 'package:flutter/material.dart';

class StockManagementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Manajemen Stok",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Filter action
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent.shade100, Colors.white],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                  hintText: "Cari nama atau kode barang",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: const Text("Mo"),
                        backgroundColor: Colors.blueAccent.shade100,
                      ),
                      title: const Text(
                        "mouse",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: const Text("M6152339MX04027\nHrg dasar Rp 100.000"),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "8",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          const Text("Rp 150.000"),
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
                                                backgroundColor: Colors.blueAccent,
                                                child: const Icon(Icons.mouse, color: Colors.white),
                                              ),
                                              title: const Text(
                                                "mouse",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              subtitle: const Text("M6152339MX04027"),
                                              trailing: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  const Text(
                                                    "Rp 150.000",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  const Text("8"),
                                                ],
                                              ),
                                            ),
                                            const Divider(),
                                            ListTile(
                                              title: const Text("Tambah / kurang stok"),
                                              trailing: const Icon(Icons.chevron_right),
                                              onTap: () {
                                                // Tambah stok action
                                              },
                                            ),
                                            ListTile(
                                              title: const Text("Edit / lihat stok"),
                                              trailing: const Icon(Icons.chevron_right),
                                              onTap: () {
                                                // Edit stok action
                                              },
                                            ),
                                            ListTile(
                                              title: const Text("Log Barang"),
                                              trailing: const Icon(Icons.chevron_right),
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
                                          backgroundColor: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          minimumSize: const Size(double.infinity, 48),
                                        ),
                                        child: const Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambah barang action
        },
        child: const Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
    );
  }
}