import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/profile/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                },
                child: const Text("Edit Profile",
                    style: TextStyle(color: Color(0xFF10745C), fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF10745C),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text('Profile', style: TextStyle(fontSize: 24)),
                SizedBox(height: 40),
                Container(
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
                ListTile(
                  title: Text('Nama', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('Wafi Azmi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                ListTile(
                  title: Text('Kode Referal', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('null', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                ListTile(
                  title: Text('Role user', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('Owner', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                ListTile(
                  title: Text('Email', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('wafiskj123@gmail.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                ListTile(
                  title: Text('Telepon', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('+6285749731492', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                ListTile(
                  title: Text('Alamat', style: TextStyle(fontSize: 13, color: Colors.grey)),
                  subtitle: Text('null', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Container(
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Log Out",
                        style: TextStyle(color: Color(0xFF10745C),fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}