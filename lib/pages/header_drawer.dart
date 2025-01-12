import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/profile/profile.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
      },
      child: Container(
        color: Color(0xFF10745C),
        width: double.infinity,
        height: 100,
        padding: EdgeInsets.only(top: 20.0, left: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 15),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/image/user.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gajah Terbang",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "gajahterbang@gmail.com",
                  style: TextStyle(color: Colors.grey[200], fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
