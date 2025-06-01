import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable{
  final int id;
  final String email;
  final String password;
  final String userName;


  const RegisterEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.userName,

  });

  @override
  List<Object?> get props => [id, email, password, userName];
}