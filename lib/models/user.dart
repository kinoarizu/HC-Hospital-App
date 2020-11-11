part of 'models.dart';

class User extends Equatable {
  final String name;
  final String gender;
  final String email;
  final String phoneNumber;

  User({
    this.name,
    this.gender,
    this.email,
    this.phoneNumber,
  });

  @override
  List<Object> get props => [name, gender, email, phoneNumber];

  User.fromJson(Map<String, dynamic> json) : 
    name = json['name'],
    gender = json['gender'],
    email = json['email'],
    phoneNumber = json['phone_number']
  ;

  Map<String, dynamic> toJson() => {
    'name': name,
    'gender': gender,
    'email': email,
    'phone_number': phoneNumber,
  };
}