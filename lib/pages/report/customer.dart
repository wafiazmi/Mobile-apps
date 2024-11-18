import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}
// Pada kelas _CustomerPageState, objek-objek TextEditingController digunakan 
//untuk mengontrol input teks pada form yang ada di halaman customer. 
// Setiap TextEditingController dibuat untuk masing-masing field input, sehingga dapat mengelola data yang dimasukkan oleh pengguna dan memudahkan pengambilan atau pengaturan nilai dari setiap field
class _CustomerPageState extends State<CustomerPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

// Variabel boolean ini digunakan untuk memeriksa valid atau tidaknya masing-masing input pada form halaman customer.
  bool _isNameValid = true;
  bool _isPointsValid = true;
  bool _isCodeValid = true;
  bool _isEmailValid = true;
  bool _isPhoneValid = true;
  bool _isAddressValid = true;

// Fungsi _saveData() ini berfungsi untuk memvalidasi setiap field input di form sebelum data disimpan. 
  void _saveData() {
    setState(() {
      _isNameValid = _nameController.text.isNotEmpty;
      _isPointsValid = _pointsController.text.isNotEmpty;
      _isCodeValid = _codeController.text.isNotEmpty;
      _isEmailValid = _emailController.text.isNotEmpty;
      _isPhoneValid = _phoneController.text.isNotEmpty;
      _isAddressValid = _addressController.text.isNotEmpty;
    });

// kode ini digunakan untuk memastikan bahwa semua field input pada form sudah valid sebelum mengeksekusi tindakan lebih lanjut, 
//seperti menampilkan atau memproses data yang diinput oleh pengguna.
    if (_isNameValid &&
        _isPointsValid &&
        _isCodeValid &&
        _isEmailValid &&
        _isPhoneValid &&
        _isAddressValid) {
      String name = _nameController.text;
      String points = _pointsController.text;
      String code = _codeController.text;
      String email = _emailController.text;
      String phone = _phoneController.text;
      String address = _addressController.text;

      print('Name: $name');
      print('Points: $points');
      print('Code: $code');
      print('Email: $email');
      print('Phone: $phone');
      print('Address: $address');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.person,
                        size: screenWidth * 0.15,
                        color: Colors.green,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: screenWidth * 0.07,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Add Customer",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              buildRoundedTextField("Nama", "Name", controller: _nameController, isValid: _isNameValid),
              buildRoundedTextField("Poin", "Poin", controller: _pointsController, isValid: _isPointsValid, hint: "Set Poin awal dapat diedit di menu Marketing-Loyalti Poin"),
              buildRoundedTextField("Kode", "kode", controller: _codeController, isValid: _isCodeValid),
              buildRoundedTextField("Email (Opsional)", "Email", controller: _emailController, isValid: _isEmailValid, hint: "*Harap mengisi dengan email sebenarnya, atau kosongkan kolom email"),
              buildPhoneField("Telephone", "+62", controller: _phoneController, isValid: _isPhoneValid),
              buildRoundedTextField("Alamat", "Address", controller: _addressController, isValid: _isAddressValid),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveData,
                child: Text(
                  "SAVE",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRoundedTextField(String label, String placeholder, {TextEditingController? controller, bool isValid = true, String? hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: isValid ? Colors.black : Colors.red)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
            suffixIcon: hint != null ? Icon(Icons.info_outline, color: Colors.grey) : null,
          ),
        ),
        if (!isValid)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "Field ini tidak boleh kosong",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        if (hint != null && isValid)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              hint,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget buildPhoneField(String label, String prefix, {TextEditingController? controller, bool isValid = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: isValid ? Colors.black : Colors.red)),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 16, right: 8),
              child: Text(
                prefix,
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            hintText: "Phone Number",
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: isValid ? Colors.grey : Colors.red),
            ),
          ),
        ),
        if (!isValid)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "Field ini tidak boleh kosong",
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        SizedBox(height: 16),
      ],
    );
  }
}
