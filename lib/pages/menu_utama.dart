// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import "package:pemrogramanbergerak/kategori-barang/kategori_barang.dart";
import "package:pemrogramanbergerak/manajemen-stok/manajemen.dart";
import "package:pemrogramanbergerak/pages/product/menu_product.dart";
import "package:pemrogramanbergerak/pages/report/main.dart";
import "sample.dart";
import "header_drawer.dart";

class MenuUtama extends StatefulWidget {
  const MenuUtama({super.key});

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  final List<DrawerItem> _drawerItems = [
    DrawerItem(
      title: "Home",
      navigateTo: const SamplePage(),
    ),
    DrawerItem(
      title: "Management",
      navigateTo: const MenuUtama(),
    ),
    DrawerItem(
      title: "Sales Transaction",
      navigateTo: const SamplePage(),
    ),
    DrawerItem(
      title: "Report",
      navigateTo: const Report(),
    ),
    DrawerItem(
      title: "Finance",
      navigateTo: const SamplePage(),
    ),
    DrawerItem(
      title: "Shift",
      navigateTo: const SamplePage(),
    ),
    DrawerItem(
      title: "Setting",
      navigateTo: const SamplePage(),
    ),
  ];

  final List<DrawerItem> _bottomDrawerItems = [
    DrawerItem(
      title: "Help & Support",
      navigateTo: const SamplePage(),
    ),
    DrawerItem(
      title: "Financing",
      navigateTo: const SamplePage(),
    ),
  ];

  final List<MenuItemData> _menuItems = [
    MenuItemData(
      title: "Products and Services",
      imagePath: "assets/suplier.png",
      navigateTo: const MenuProduct(),
    ),
    MenuItemData(
      title: "Product Category",
      imagePath: "assets/menu-app.png",
      navigateTo: const Kategori(),
    ),
    MenuItemData(
      title: "Manajemen Stok",
      imagePath: "assets/delivery-box.png",
      navigateTo:  StockManagementPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Management",
        style: TextStyle(
          color: Color(0xFF10745C),
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyHeaderDrawer(),
            ..._drawerItems.map(_buildDrawerItem),
            _buildEWalletButton(),
            const Divider(color: Colors.grey),
            ..._bottomDrawerItems.map(_buildDrawerItem),
            const Divider(color: Colors.grey),
            _buildLastSync(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(DrawerItem item) {
    return ListTile(
      title: Text(item.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => item.navigateTo,
          ),
        );
      },
    );
  }

  Widget _buildEWalletButton() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 60.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF10745C), width: 1.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text(
          "Integrate E-Wallet",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildLastSync() {
    return const ListTile(
      title: Text(
        "Last Sync",
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      subtitle: Text(
        "-",
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: _menuItems
            .map((item) => CustomMenuWidget(
                  textMenu: item.title,
                  pathImages: item.imagePath,
                  tujuanNavigasi: item.navigateTo,
                ))
            .toList(),
      ),
    );
  }
}

class DrawerItem {
  final String title;
  final Widget navigateTo;
  DrawerItem({required this.title, required this.navigateTo});
}

class MenuItemData {
  final String title;
  final String imagePath;
  final Widget navigateTo;
  MenuItemData(
      {required this.title, required this.imagePath, required this.navigateTo});
}

class CustomMenuWidget extends StatelessWidget {
  final Widget tujuanNavigasi;
  final String pathImages;
  final String textMenu;

  const CustomMenuWidget({
    super.key,
    this.tujuanNavigasi = const SamplePage(),
    this.pathImages = "assets/box.png",
    required this.textMenu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => tujuanNavigasi,
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                pathImages,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 10),
              Text(
                textMenu,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
