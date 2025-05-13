import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/sized_box.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:alefk/core/themes/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'custom_bottom_sheet.dart';

class FacebookPostCard extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String timestamp;
  final String content;
  final List<String>? imageUrls; // <-- Changed from String? to List<String>?

  const FacebookPostCard({
    super.key,
    required this.avatarUrl,
    required this.userName,
    required this.timestamp,
    required this.content,
    this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.current.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User info
            Row(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName, style: TextStyles.large),
                    Text(
                      timestamp,
                      style: TextStyles.mediumItalic.copyWith(
                        color: AppColors.current.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBoxConstants.verticalMedium,

            // Post content
            Text(
              content,
              style: TextStyles.medium.copyWith(
                color: AppColors.current.text,
              ),
            ),
            const SizedBox(height: 12.0),

            // Carousel Image Slider
            if (imageUrls != null && imageUrls!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
                  items: imageUrls!.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            // Image
                            Image.asset(
                              url,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            // Image.network(
                            //   url,
                            //   fit: BoxFit.cover,
                            //   width: double.infinity,
                            //   loadingBuilder:
                            //       (context, child, loadingProgress) {
                            //     if (loadingProgress == null) return child;
                            //     return const Center(
                            //       child: CircularProgressIndicator(),
                            //     );
                            //   },
                            //   errorBuilder: (context, error, stackTrace) {
                            //     return const Center(
                            //       child: Icon(Icons.broken_image, size: 50),
                            //     );
                            //   },
                            // ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            if (imageUrls != null && imageUrls!.isNotEmpty)
              const SizedBox(height: 12.0),

            // Divider
            Divider(
              color: AppColors.current.gray.withOpacity(0.5),
              thickness: 1.0,
              height: 0.0,
            ),
            SizedBoxConstants.verticalMedium,

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(
                  icon: IconlyBrokenIcons.heart,
                  label: "Like",
                  context: context,
                  index: 0,
                ),
                _buildActionButton(
                  icon: IconlyBrokenIcons.chat,
                  label: "Comment",
                  context: context,
                  index: 1,
                ),
                _buildActionButton(
                    icon: IconlyBrokenIcons.send,
                    label: "Share",
                    context: context,
                    index: 0),
              ],
            ),
            SizedBoxConstants.verticalMedium,
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
      {required Icon icon,
      required String label,
      required BuildContext context,
      required int index}) {
    return InkWell(
      highlightColor: AppColors.current.transparent,
      splashColor: AppColors.current.transparent,
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return BottomSheetContent(
              index: index,
            );
          },
        );
      },
      child: Row(
        children: [
          icon,
          const SizedBox(width: 5.0),
          Text(
            label,
            style: TextStyles.medium.copyWith(
              color: AppColors.current.text,
            ),
          ),
        ],
      ),
    );
  }
}
