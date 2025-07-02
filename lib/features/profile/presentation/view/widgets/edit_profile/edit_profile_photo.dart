import 'dart:convert';
import 'dart:io';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/profile/domain/entity/edit_profile_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../bloc/profile_bloc.dart';
import '../../../bloc/profile_events.dart';
import '../../../bloc/profile_states.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

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
        // Update cache
        final updatedUserData = userData.copyWith(image: base64Image);
        await DI.find<ICacheManager>().setUserData(updatedUserData);

        // Dispatch event to update API
        final updatedEntity = EditProfileEntity(
          id: userData.id,

          userName: userData.userName,
          phone: userData.phone.toString(),
          image: base64Image,

          country: userData.country,
          city: userData.city,
          age: userData.age,
          gender: userData.gender,
          address: userData.address,
          idImage: userData.idImage,
        );
        context.read<EditProfileBloc>().add(SaveProfileChangesEvent(updatedEntity));
        // Trigger UI update with new Base64 image
        context.read<EditProfileBloc>().add(PickProfileImageEvent(base64Image));
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
        final imagePath = userData?.image;

        ImageProvider imageProvider;
        if (imagePath != null && imagePath.isNotEmpty) {
          try {
            final bytes = base64Decode(imagePath);
            imageProvider = MemoryImage(bytes);
          } catch (_) {
            imageProvider = const AssetImage('assets/images/profile.png');
          }
        } else {
          imageProvider = const AssetImage('assets/images/profile.png');
        }

        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: imageProvider,
              onBackgroundImageError: (_, __) {},
            ),
            GestureDetector(
              onTap: () => _showPicker(context),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.blue,
                child: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}