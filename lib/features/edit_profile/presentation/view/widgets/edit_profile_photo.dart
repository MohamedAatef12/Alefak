import 'package:flutter/material.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 50, // Adjust the size as needed
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                // Handle edit action
                print('Edit icon tapped');
              },
              child: const CircleAvatar(
                radius: 15, // Size of the edit icon background
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 15, // Size of the edit icon
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}