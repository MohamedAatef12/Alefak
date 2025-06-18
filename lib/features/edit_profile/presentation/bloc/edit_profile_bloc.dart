import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/edit_profile/domain/use_case/edit_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_profile_events.dart';
import 'edit_profile_states.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileUseCase editProfileUseCase;
  final user = DI.find<ICacheManager>().getUserData()!;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
   int? selectedAge;
   String? selectedGender;
   String? selectedCountry;
   String? selectedCity;
  EditProfileBloc(
      this.editProfileUseCase,
)
      : super(EditProfileInitial()) {
    on<PickProfileImageEvent>((event, emit) {
      emit(ProfileImagePicked(event.base64Image));
    });
    on<PickIdImageEvent>((event, emit) {
      emit(IdImagePicked(event.base64Image));
    });
    on<SaveProfileChangesEvent>((event, emit) async {
      emit(EditProfileLoading());
      final result = await editProfileUseCase(event.entity);
      result.fold(
        (failure) => emit(EditProfileFailure(failure.message)),
        (_) => emit(EditProfileSuccess()),
      );
    });
  }
}
