part of 'models.dart';

class Patient extends Equatable {
  final String name;
  final String gender;
  final String email;
  final String phoneNumber;
  final String status;

  Patient({
    this.name,
    this.gender,
    this.email,
    this.phoneNumber,
    this.status,
  });

  @override
  List<Object> get props => [name, gender, email, phoneNumber, status];

  Patient.fromJson(Map<String, dynamic> json) : 
    name = json['name'],
    gender = json['gender'],
    email = json['email'],
    phoneNumber = json['phone_number'],
    status = json['status']
  ;

  Map<String, dynamic> toJson() => {
    'name': name,
    'gender': gender,
    'email': email,
    'phone_number': phoneNumber,
    'status': status,
  };
}