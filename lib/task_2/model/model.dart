
class User {
  final int id;
  final int age;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String image;

  User({required this.id, required this.firstName, required this.lastName, required this.email,required this.gender,required this.phone,required this.image,required this.age});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      age:json['age'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      gender:json['gender'],
      phone:json['phone'],
      image:json['image'],
    );
  }
}
