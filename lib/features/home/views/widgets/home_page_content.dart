import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:flutter/material.dart';

import 'custom_add_post_button.dart';
import 'custom_home_list.dart';
import 'custom_sliver_delegate.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: false,
          delegate: CustomSliverAppBarDelegate(),
        ),
        const SliverToBoxAdapter(
          child: SizedBoxConstants.verticalMedium,
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: PaddingConstants.horizontalMedium,
            child: CustomAddPostButton(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBoxConstants.verticalMedium,
        ),
        const CustomHomeList(),
      ],
    );
  }
}
