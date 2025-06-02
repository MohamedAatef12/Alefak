import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final int id;
  final String email;
  final String password;
  final String userName;
  final int phone;
  final String country;
  final String city;
  final String image;


  const RegisterEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,
    required this.phone,
    required this.country,
    required this.city,
    required this.image,

  });

  @override
  List<Object?> get props => [id, email, password, userName, phone, country, city, image];
}