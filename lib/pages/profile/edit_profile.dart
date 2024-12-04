import 'package:flutter/material.dart';
import 'package:pemrogramanbergerak/pages/profile/foto.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController(text: "Wafi Azmi");
  final TextEditingController emailController = TextEditingController(text: "wafiskj123@gmail.com");
  final TextEditingController phoneController = TextEditingController(text: "+6285749731492");
  final TextEditingController addressController = TextEditingController(text: "null");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Back action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile picture
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Foto()));
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF10745C),
                          radius: 15,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Edit Profil',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Input fields
              buildTextField("Nama", nameController),
              buildTextField("Email", emailController, isReadOnly: true),
              Row(
                children: [
                  Expanded(
                    child: buildTextField("Telepon", phoneController, isReadOnly: true),
                  ),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      // Change phone number functionality
                    },
                    child: Text(
                      "Ubah nomor",
                      style: TextStyle(color: Color(0xFF10745C)),
                    ),
                  ),
                ],
              ),
              buildTextField("Alamat", addressController),
              SizedBox(height: 10),
              // Save button
              ElevatedButton(
                onPressed: () {
                  // Save action
                },
                child: Text(
                  'SIMPAN', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF10745C),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller, {bool isReadOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextField(
          controller: controller,
          readOnly: isReadOnly,
          decoration: InputDecoration(
            hintText: label,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}