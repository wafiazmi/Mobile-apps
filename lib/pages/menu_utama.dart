// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import "sample.dart";
import "header_drawer.dart";

class MenuUtama extends StatefulWidget {
  const MenuUtama({super.key});

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Management",
          style: TextStyle(
            color: Color(0xFF10745C),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyHeaderDrawer(),
              ListTile(
                title: const Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Management"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Sales Transaction"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Credit"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("PPOB"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Report"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Finance"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Shift"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Setting"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 60.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF10745C), width: 1.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Integrate E-Wallet",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text("Referral"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("My Online Store"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Help & Support"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text("Financing"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuUtama(),
                    ),
                  );
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Text("Last Sync",
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                subtitle: Text("-",
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            customMenuWidget(
              text_menu: "Products and Services",
              path_images: "assets/delivery-box.png",
              tujuanNavigasi: const SamplePage(),
            ),
            customMenuWidget(
              text_menu: "Product Category",
              path_images: "assets/box.png",
              tujuanNavigasi: const SamplePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class customMenuWidget extends StatelessWidget {
  Widget? tujuanNavigasi;
  String? path_images;
  String text_menu;

  customMenuWidget({
    super.key,
    this.tujuanNavigasi = const SamplePage(),
    this.path_images = "assets/box.png",
    required this.text_menu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tujuanNavigasi!,
            ));
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                path_images!,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text_menu,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
