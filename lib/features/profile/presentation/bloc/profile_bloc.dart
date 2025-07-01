import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/profile/domain/use_case/edit_profile_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_events.dart';
import 'profile_states.dart';

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

  // State values
  bool isExpanded = false;
  int currentTabIndex = 0;
  List<dynamic> currentTabItems = [];

  EditProfileBloc(this.editProfileUseCase)
      : super(const EditProfileInitial()) {
    on<PickProfileImageEvent>((event, emit) {
      emit(ProfileImagePicked(
        base64Image: event.base64Image,
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,

      ));
    });

    on<PickIdImageEvent>((event, emit) {
      emit(IdImagePicked(
        base64Image: event.base64Image,
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,
      ));
    });

    on<SaveProfileChangesEvent>((event, emit) async {
      emit(EditProfileLoading(
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,
      ));
      final result = await editProfileUseCase(event.entity);
      result.fold(
            (failure) => emit(EditProfileFailure(
          message: failure.message,
          isExpanded: isExpanded,
          tabIndex: currentTabIndex,
          items: currentTabItems,
        )),
            (_) => emit(EditProfileSuccess(
          isExpanded: isExpanded,
          tabIndex: currentTabIndex,
          items: currentTabItems,
        )),
      );
    });

    on<ToggleProfileInfoExpansionEvent>((event, emit) {
      isExpanded = !isExpanded;
      emit(EditProfileInitial(
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,
      ));
    });

    on<ChangeTabEvent>((event, emit) async {
      currentTabIndex = event.tabIndex;
      // Load items for the new tab
      List<dynamic> items = [];
      if (event.tabIndex == 0) {
        items = ['Item 1A', 'Item 1B'];
      } else if (event.tabIndex == 1) {
        items = ['Item 2A', 'Item 2B'];
      } else if (event.tabIndex == 2) {
        items = ['Item 3A', 'Item 3B'];
      }
      currentTabItems = items;
      emit(EditProfileInitial(
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,
      ));
    });
    on<LoadUserDataEvent>((event, emit) {
      final newUser = DI.find<ICacheManager>().getUserData();
      emit(EditProfileInitial(
        isExpanded: isExpanded,
        tabIndex: currentTabIndex,
        items: currentTabItems,
        userData: newUser,
      ));
    });

  }
}
