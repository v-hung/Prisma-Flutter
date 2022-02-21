class User {
  int? id;
  String? name;
  String? email;
  String? image;

  User({ this.id, this.name, this.email, this.image });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
    );
  }
}
