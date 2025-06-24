import 'package:equatable/equatable.dart';
import 'package:alefk/features/auth/delete_account/domain/entity/delete_account_entity.dart';

abstract class DeleteAccountEvent extends Equatable {
  const DeleteAccountEvent();

  @override
  List<Object?> get props => [];
}

class DeleteAccountRequested extends DeleteAccountEvent {
  final DeleteAccountEntity entity;

  const DeleteAccountRequested(this.entity);

  @override
  List<Object?> get props => [entity];
}
class DeleteAccountRequestedWithPassword extends DeleteAccountEvent {

  final String password;

  const DeleteAccountRequestedWithPassword({

    required this.password,
  });

  @override
  List<Object?> get props => [password];
}
class DeleteAccountReset extends DeleteAccountEvent {}

