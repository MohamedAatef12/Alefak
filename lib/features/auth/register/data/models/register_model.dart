import 'package:alefk/features/auth/register/domain/entities/register_domain_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({  required super.id,
    required super.email,
    required super.password,
    required super.userName,
    required super.phone,
    required super.country,
    required super.city,
    required super.image,

  }) ;
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'userName': userName,
        'phone': phone,
        'country': country,
        'city': city,
        'image': image,
      };
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      userName: json['userName'] as String,
      phone: json['phone'] as int,
      country: json['country'] as String,
      city: json['city'] as String,
      image: json['image'] as String,


    );
  }
RegisterModel.fromEntity(RegisterEntity entity)
      : super(
          id: entity.id,
          email: entity.email,
          password: entity.password,
          userName: entity.userName,
          phone: entity.phone,
          country: entity.country,
          city: entity.city,
          image: entity.image,
        );
RegisterEntity toEntity(RegisterModel model) {
    return RegisterEntity(
      id: model.id,
      email: model.email,
      password: model.password,
      userName: model.userName,
      phone: model.phone,
      country: model.country,
      city: model.city,
      image: model.image,
    );
  }
}
