class User {
  int? id;
  String? name;
  String? email;
  String? image;
  int? following;
  int? followers;
  int? posts;

  User({ this.id, this.name, this.email, this.image, this.followers, this.following, this.posts });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      image: json['image'],
      followers: json['followers'],
      following: json['following'],
      posts: json['posts'],
    );
  }
}
