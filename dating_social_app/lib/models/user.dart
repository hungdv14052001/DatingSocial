class User {
  late int? id;
  final String? name;
  final String? avatar;
  final String? numberPhone;
  final String? email;
  final String? address;
  final String? username;
  final String? password;
  final String? createdDate;

  User({
    this.id,
    this.name,
    this.address,
    this.email,
    this.numberPhone,
    this.username,
    this.avatar,
    this.password,
    this.createdDate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      avatar: json['avatar'] ?? '',
      numberPhone: json['numberPhone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      createdDate: json['createdDate'] ?? '',
    );
  }
}
