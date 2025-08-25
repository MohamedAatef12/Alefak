import 'package:equatable/equatable.dart';

import '../../../register/data/models/register_model.dart';

class LoginResponseEntity extends Equatable {
  final RegisterModel user; // or UserEntity if you have one
  final String token;

  const LoginResponseEntity({
    required this.token,
    required this.user,
  });

  @override
  List<Object?> get props => [
        token,
        user,
      ];
}
