import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:genie/pages/archive_screen.dart';
import 'package:genie/pages/chat_screen.dart';
import 'package:genie/pages/menus.dart';
import 'package:genie/pages/option_screen.dart';
import 'package:genie/pages/profile.dart';
import 'package:genie/utils/token.dart';
import 'package:genie/utils/token_service.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Menus(),
    const OptionScreen(),
    const ArchiveScreen(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    log("Token: ${Token.token}");
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_sharp),
            label: 'Ai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0XFF309BF2),
        onTap: _onItemTapped,
        unselectedItemColor: Colors.blue.withOpacity(0.7),
      ),
    );
  }
}
