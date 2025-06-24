import 'package:equatable/equatable.dart';

class DeleteAccountEntity extends Equatable {
  final String password;
  const DeleteAccountEntity( {
    required this.password,
  });

  @override
  List<Object?> get props => [password];
}
