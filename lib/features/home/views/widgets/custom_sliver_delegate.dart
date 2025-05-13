import 'package:flutter/material.dart';

import 'custom_home_app_bar.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CustomHomeAppBar();
  }

  @override
  double get maxExtent => 110; // Adjust based on CustomHomeAppBar height
  @override
  double get minExtent => 110; // Same as maxExtent for static height

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
