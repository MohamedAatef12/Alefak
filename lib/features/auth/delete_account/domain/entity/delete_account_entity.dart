import 'package:equatable/equatable.dart';

class DeleteAccountEntity extends Equatable {
  final int userId;
  const DeleteAccountEntity({
    required this.userId,
  });

  @override
  List<Object?> get props => [userId];
}
