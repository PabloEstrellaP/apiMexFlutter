 class User {
  final String name;
  final String lastName;
  final String email;
  final String imgPath;
  final String id;

  User({
    required this.name,
    required this.lastName,
    required this.email,
    required this.imgPath,
    required this.id,
  });

  User.fromJson(Map <String, dynamic> json)
      : name = json['name'],
        lastName = json['lastName'],
        email = json['email'],
        imgPath = json['imgPath'],
        id = json['_id'];
}