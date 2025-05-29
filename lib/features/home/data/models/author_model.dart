import 'package:alefk/features/home/domain/entities/author_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    required super.id,
    required super.email,
    required super.password,
    required super.phone,
    required super.country,
    required super.city,
    required super.userName,
    required super.imageUrl,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      userName: json['userName'] as String,
      imageUrl: json['image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'phone': phone,
      'country': country,
      'city': city,
      'userName': userName,
      'image': imageUrl,
    };
  }

  AuthorModel.fromEntity(AuthorEntity author)
      : super(
          id: author.id,
          email: author.email,
          password: author.password,
          phone: author.phone,
          country: author.country,
          city: author.city,
          userName: author.userName,
          imageUrl: author.imageUrl,
        );

  AuthorEntity toEntity(AuthorModel model) => AuthorEntity(
        id: id,
        email: email,
        password: password,
        phone: phone,
        country: country,
        city: city,
        userName: userName,
        imageUrl: imageUrl,
      );
}
