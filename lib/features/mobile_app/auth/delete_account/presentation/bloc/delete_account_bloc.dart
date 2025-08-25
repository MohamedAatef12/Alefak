import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/delete_account_entity.dart';
import '../../domain/use_cases/delete_account_use_case.dart';
import 'delete_account_events.dart';
import 'delete_account_states.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final DeleteAccountUseCase useCase;
  final passwordController = TextEditingController();
  DeleteAccountBloc(this.useCase) : super(DeleteAccountInitial()) {
    on<DeleteAccountRequestedWithPassword>((event, emit) async {
      emit(DeleteAccountLoading());
      final entity = DeleteAccountEntity(userId: event.userId);
      final result = await useCase(entity);
      result.fold(
        (failure) => emit(DeleteAccountFailure(failure.message)),
        (_) => emit(DeleteAccountSuccess()),
      );
    });
  }
}
