import 'package:alefk/features/auth/register/data/models/register_model.dart';
import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final RegisterModel user; // or UserEntity if you have one
  final String token;
  final String? role;

  const LoginResponseEntity( {
    required this.token,
    required this.user,
    required this.role,
  });

  @override

  List<Object?> get props =>[
    token,
    user,
    role,
  ];


}