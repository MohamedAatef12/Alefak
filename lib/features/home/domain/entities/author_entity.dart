import 'package:equatable/equatable.dart';

class AuthorEntity extends Equatable {
  final int id;
  final String email;
  final String password;
  final String phone;
  final String country;
  final String city;
  final String userName;
  final String? imageUrl;

  const AuthorEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.phone,
    required this.country,
    required this.city,
    required this.userName,
    this.imageUrl,
  });

  @override
  List<Object?> get props =>
      [id, email, password, phone, country, city, userName, imageUrl];
}
