import 'package:alefk/features/about_us/presentation/view/widgets/developer_card.dart' show DeveloperCard;
import 'package:flutter/material.dart' ;

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return const DeveloperCard(
          name: 'Ahmed Mohamed',
        );
      },
    );
  }
}
