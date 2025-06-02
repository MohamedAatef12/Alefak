import 'package:alefk/core/config/cache_manager/i_cache_manager.dart';
import 'package:alefk/core/config/di/di_wrapper.dart';
import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          width: 100,
        ),
        DI.find<ICacheManager>().getUserData() != null
            ? Text(
                DI.find<ICacheManager>().getUserData()!.userName ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              )
            : const SizedBox.shrink(),
        const Spacer(),
        IconlyBrokenIcons.search,
        SizedBoxConstants.horizontalMedium,
        IconlyBrokenIcons.notification,
        SizedBoxConstants.horizontalMedium,
      ],
    );
  }
}
