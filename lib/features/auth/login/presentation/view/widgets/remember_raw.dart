import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RememberMeRow extends StatefulWidget {
  final double screenWidth;
  const RememberMeRow({super.key, required this.screenWidth});

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConstants.horizontalSmall,
      child: Row(
        children: [
          Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
            activeColor: AppColors.current.green,
          ),
          Text(
            'Remember Me',
            style: TextStyle(
              fontSize: widget.screenWidth * 0.04,
              color: AppColors.current.text,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
      context.pushNamed('forgot_password');
            },
            child: Text(
              'Forget Password?',
              style: TextStyle(
                fontSize: widget.screenWidth * 0.04,
                color: AppColors.current.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}