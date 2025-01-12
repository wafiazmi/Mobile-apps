import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/login/login_page.dart';
import 'package:pemrogramanbergerak/pages/menu_utama.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const TextField(
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            const SizedBox(
              height: 24,
            ),
            const TextField(
              style: TextStyle(fontSize: 16),
              obscureText: true,
              obscuringCharacter: 'P',
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            const SizedBox(
              height: 24,
            ),
            const TextField(
              style: TextStyle(fontSize: 16),
              obscureText: true,
              obscuringCharacter: 'P',
              decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
            ),
            const SizedBox(
              height: 24,
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/image/google.png',
                    height: 24,
                    width: 36,
                  ),
                ),
                const SizedBox(width: 8),
                // TextField untuk nomor telepon
                const Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        label: Text("Phone Number"),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)))),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            // Tambahan tombol register dengan Google
            Column(
              children: [
                TextButton(
                  onPressed: () {
                    // Aksi login dengan Google
                  },
                  child: const Text(
                    'Register with Google',
                    style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 8),
                // Gambar Google sebagai button
                TextButton(
                  onPressed: () {
                    // Aksi ketika tombol gambar Google diklik
                  },
                  child: Image.asset(
                    'assets/image/google.png', // Pastikan gambar ada di folder assets
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}