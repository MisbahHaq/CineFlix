import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:cineflix/Pages/booking.dart';
import 'package:cineflix/Pages/profile.dart';
import 'package:cineflix/Pages/home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  final List<Widget> pages = [
    Home(),
    Booking(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pages[currentTabIndex],
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return CurvedNavigationBar(
            index: currentTabIndex,
            backgroundColor: Colors.transparent,
            color: Color.fromARGB(255, 204, 151, 7),
            height: 60,
            animationDuration: Duration(milliseconds: 300),
            onTap: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            items: [
              Icon(Icons.home, color: Colors.white, size: 30),
              Icon(Icons.book, color: Colors.white, size: 30),
              Icon(Icons.person, color: Colors.white, size: 30),
            ],
          );
        },
      ),
    );
  }
}
