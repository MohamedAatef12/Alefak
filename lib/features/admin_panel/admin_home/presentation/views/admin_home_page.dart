import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int selectedIndex = 0;

  final List<String> tabs = [
    'Orders',
    'Transactions',
    'Traders',
    'Customers',
    'Products',
    'Analytics',
  ];

  final List<Widget> _pages = const [
    Center(child: Text('Orders Page')),
    Center(child: Text('Transactions Page')),
    Center(child: Text('Traders Page')),
    Center(child: Text('Customers Page')),
    Center(child: Text('Products Page')),
    Center(child: Text('Analytics Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Row(
          children: [
            // Logo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo2.svg',
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Alefak',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),

            // Tabs in one container
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: List.generate(tabs.length, (index) {
                      final bool isSelected = selectedIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.black87
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            tabs[index],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Individual icon containers
            _IconButtonContainer(
              icon: Icons.settings,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _IconButtonContainer(
              icon: Icons.notifications_none_outlined,
              badgeColor: Colors.amber,
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _IconButtonContainer(
              icon: Icons.person,
              iconColor: Colors.white,
              backgroundColor: Colors.black26,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _pages[selectedIndex],
    );
  }
}

// Icon Button Container with optional badge
class _IconButtonContainer extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? badgeColor;

  const _IconButtonContainer({
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black87,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              size: 22,
              color: iconColor,
            ),
          ),
          if (badgeColor != null)
            Positioned(
              right: -2,
              top: -2,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: badgeColor,
              ),
            ),
        ],
      ),
    );
  }
}
