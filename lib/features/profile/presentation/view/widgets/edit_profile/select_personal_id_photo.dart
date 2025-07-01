import 'dart:convert';
import 'dart:io';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:alefk/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../bloc/profile_bloc.dart';
import '../../../bloc/profile_events.dart';
import '../../../bloc/profile_states.dart';

class SelectPersonalIdImage extends StatelessWidget {
  const SelectPersonalIdImage({super.key});

  Future<bool> requestCameraAndGalleryPermissions() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();
    return cameraStatus.isGranted && storageStatus.isGranted;
  }
  Future<void> _pickAndSaveImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await File(pickedFile.path).readAsBytes();
      final base64Image = base64Encode(bytes);
      final userData = DI.find<ICacheManager>().getUserData();
      if (userData != null) {
        final updatedUserData = userData.copyWith(idImage: base64Image);
        await DI.find<ICacheManager>().setUserData(updatedUserData);
        final updatedEntity = EditProfileEntity(
          id: userData.id,
          email: userData.email,
          userName: userData.userName,
          phone: userData.phone.toString(),
          image: base64Image,
          password: userData.password,
          country: userData.country,
          city: userData.city,
          age: userData.age,
          gender: userData.gender,
          address: userData.address,
          idImage: userData.idImage,
        );
        context.read<EditProfileBloc>().add(SaveProfileChangesEvent(updatedEntity));
        context.read<EditProfileBloc>().add(PickIdImageEvent(base64Image));
      }
    }
  }

  Future<void> _showPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title:  Text('gallery'.tr()),
                onTap: () async {
                  Navigator.of(context).pop();
                  await Future.delayed(const Duration(milliseconds: 100));
                  await _pickAndSaveImage(context, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title:  Text('camera'.tr()),
                onTap: () async {
                  if (!await Permission.camera.request().isGranted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('camera_permission_denied'.tr())),
                    );
                    return;
                  }
                  Navigator.of(context).pop();
                  await Future.delayed(const Duration(milliseconds: 100));
                  await _pickAndSaveImage(context, ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileBloc, EditProfileState>(
      builder: (context, state) {
        final userData = DI.find<ICacheManager>().getUserData();
        final imagePath = userData?.idImage;

        Widget content;
        if (imagePath != null && imagePath.isNotEmpty) {
          try {
            final bytes = base64Decode(imagePath);
            content = Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: AppColors.current.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.current.text,
                  width: 0.7,
                ),
                image: DecorationImage(
                  image: MemoryImage(bytes),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => _showPicker(context),
                    child: const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } catch (_) {
            content = _buildAddPhotoUI(context);
          }
        } else {
          content = _buildAddPhotoUI(context);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: content,
        );
      },
    );
  }

  Widget _buildAddPhotoUI(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPicker(context),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: AppColors.current.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.current.text,
            width: 0.7,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: AppColors.current.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.current.text,
                width: 0.7,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Your Personal Id Photo',
                  style: TextStyles.smallBold.copyWith(
                    color: AppColors.current.text,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Image.asset('assets/images/add_photo.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}