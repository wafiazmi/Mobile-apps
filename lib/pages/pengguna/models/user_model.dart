class User {
  int? id;
  String? name;
  final String email;
  String? password;
  final String? token; // Token autentikasi, bisa null jika belum login

  User({
    required this.email,
    this.password,
    this.token,
    this.id,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  factory User.fromJson2(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      // password: json['password'],
      // token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
