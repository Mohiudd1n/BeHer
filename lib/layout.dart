import 'package:client/screens/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import './screens/home_screen.dart';
import './screens/profile_screen.dart';
import '../models/user_skin_profile.dart';

class AppLayout extends StatefulWidget {
  final UserSkinProfile profile;
  const AppLayout({super.key, required this.profile});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;

  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(), 
      ScanScreen(),
      ProfileScreen(profile: widget.profile),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60,
        backgroundColor: Colors.transparent,
        color: const Color(0xFFe06c9f), // Primary Pink
        buttonBackgroundColor: const Color(0xFFb5bfa1), // Sage Green
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          Icon(
            Icons.home, 
            size: 30, 
            color: _selectedIndex == 0 ? Colors.white : Colors.black87,
          ),
          Icon(
            Icons.camera, 
            size: 30, 
            color: _selectedIndex == 1 ? Colors.white : Colors.black87,
          ),
          Icon(
            Icons.person, 
            size: 30, 
            color: _selectedIndex == 2 ? Colors.white : Colors.black87,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}