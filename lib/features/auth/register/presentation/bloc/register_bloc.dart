import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/auth/register/data/models/register_model.dart';
import 'package:alefk/features/auth/register/domain/usecases/register_domain_usecase.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_events.dart';
import 'package:alefk/features/auth/register/presentation/bloc/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  final formKey = GlobalKey<FormState>();
  @override
  RegisterBloc(this.registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_registerSubmitted);
    on<TogglePasswordVisibility>((event, emit) {
      obscurePassword = !obscurePassword;
      emit(RegisterPasswordVisibilityChanged());
    });
  }
  Future<void> _registerSubmitted(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    final result = await registerUseCase(event.entity);
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (_) {
        final registerModel = RegisterModel.fromEntity(event.entity);
        DI.find<ICacheManager>().setUserData(registerModel);
        emit(RegisterSuccess());
      }
    );
  }
}