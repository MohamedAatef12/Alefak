import 'dart:convert';
import 'dart:io';
import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/features/edit_profile/domain/entity/edit_profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../bloc/edit_profile_bloc.dart';
import '../../bloc/edit_profile_events.dart';
import '../../bloc/edit_profile_states.dart';

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
                title: const Text('Gallery'),
                onTap: () async {
                  Navigator.of(context).pop();
                  await Future.delayed(const Duration(milliseconds: 100));
                  await _pickAndSaveImage(context, ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () async {
                  if (!await Permission.camera.request().isGranted) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Camera permission denied')),
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
        return Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: imageProvider,
                onBackgroundImageError: (_, __) {},
              ),
              Positioned(
                bottom: 0,
                right: 0,
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
            ],
          ),
        );
      },
    );
  }
}