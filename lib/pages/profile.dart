import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Text("Edit Profile"),
        ],
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, size: 35, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text('Profil', style: TextStyle(fontSize: 24)),
            SizedBox(height: 40),
            ListTile(
              title: Text('Nama'),
              subtitle: Text('Wafi Azmi'),
            ),
            ListTile(
              title: Text('Kode Referal'),
              subtitle: Text('null'),
            ),
            ListTile(
              title: Text('Role user'),
              subtitle: Text('Owner'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text('wafiskj123@gmail.com'),
            ),
            ListTile(
              title: Text('Telepon'),
              subtitle: Text('+6285749731492'),
            ),
            ListTile(
              title: Text('Alamat'),
              subtitle: Text('null'),
            ),
 ],
          ),
        ),
      )
    );
  }
}