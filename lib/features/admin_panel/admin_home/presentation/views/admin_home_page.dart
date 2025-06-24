import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0),
            theme: SidebarXTheme(
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
              selectedTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              itemTextPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              hoverColor: Colors.blue.withOpacity(0.1),
            ),
            footerDivider: const Divider(
              color: Colors.white24,
            ),
            extendedTheme: SidebarXTheme(
              width: 250,
              textStyle: TextStyle(color: Colors.white, fontSize: 16),
              selectedTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              itemTextPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              hoverColor: Colors.blue.withOpacity(0.1),
            ),
            headerBuilder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Admin Panel',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
            footerBuilder: (context, controller) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Version 1.0',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              );
            },
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'Admin Home Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
