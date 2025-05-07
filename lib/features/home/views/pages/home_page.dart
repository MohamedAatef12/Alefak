import 'package:alefk/core/constants/padding.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/features/home/views/widgets/custom_add_post_button.dart';
import 'package:alefk/features/home/views/widgets/custom_home_list.dart';
import 'package:alefk/features/home/views/widgets/custom_sliver_delegate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
        ),
      ),
    );
  }
}
