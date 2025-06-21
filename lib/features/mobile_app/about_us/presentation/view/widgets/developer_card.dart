import 'package:alefk/core/constants/icons.dart';
import 'package:alefk/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class DeveloperCard extends StatefulWidget {
  final String name;
  const DeveloperCard({super.key, required this.name});

  @override
  State<DeveloperCard> createState() => _DeveloperCardState();
}

class _DeveloperCardState extends State<DeveloperCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/developer.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.name,
                  style: TextStyles.large,
                ),
                const Spacer(),
                isExpanded
                    ? IconlyBrokenIcons.arrowDown_2
                    : IconlyBrokenIcons.arrowRight_2,
                const SizedBox(width: 10),
              ],
            ),
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Text('Email: example@email.com', style: TextStyles.medium),
                    const SizedBox(height: 4),
                    Text('Phone: +1234567890', style: TextStyles.medium),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}