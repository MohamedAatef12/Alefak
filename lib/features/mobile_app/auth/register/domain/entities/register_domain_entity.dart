import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final int id;
  final String email;
  final String password;
  final String userName;
  final String phone;
  final String country;
  final String city;
  final String image;
  final String gender;
  final int age;
  final String address;
  final String idImage;


  const RegisterEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    required this.phone,
    required this.country,
    required this.city,
    required this.image,
    required this.gender,
    required this.age,
    required this.address,
    required this.idImage,


  });

  @override
  List<Object?> get props => [id, email, password, userName, phone, country, city, image];
}
