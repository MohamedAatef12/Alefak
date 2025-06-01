import 'package:alefk/features/auth/register/domain/entities/register_domain_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel({  required super.id,
    required super.email,
    required super.password,
    required super.userName,

  }) ;
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'password': password,
        'userName': userName,
      };
  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
      userName: json['userName'] as String,

    );
  }
RegisterModel.fromEntity(RegisterEntity entity)
      : super(
          id: entity.id,
          email: entity.email,
          password: entity.password,
          userName: entity.userName,
        );
RegisterEntity toEntity(RegisterModel model) {
    return RegisterEntity(
      id: model.id,
      email: model.email,
      password: model.password,
      userName: model.userName,
    );
  }
}
