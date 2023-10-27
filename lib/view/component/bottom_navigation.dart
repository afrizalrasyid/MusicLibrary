import 'package:flutter/material.dart';
import 'package:music_library/view/category_screen.dart';
import 'package:music_library/view/customer_service_screen.dart';
import 'package:music_library/view/feedback_screen.dart';
import 'package:music_library/view/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color.fromARGB(255, 4, 13, 18),
        height: 70,
        backgroundColor: const Color.fromARGB(255, 4, 13, 18),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(color: Colors.white, Icons.home),
              icon: Icon(color: Colors.white, Icons.home_outlined),
              label: 'Home'),
          NavigationDestination(
              selectedIcon: Icon(color: Colors.white, Icons.search),
              icon: Icon(color: Colors.white, Icons.search_outlined),
              label: 'Category'),
          NavigationDestination(
              selectedIcon: Icon(color: Colors.white, Icons.feed),
              icon: Icon(color: Colors.white, Icons.feed_outlined),
              label: 'Feedback'),
          NavigationDestination(
              selectedIcon: Icon(color: Colors.white, Icons.message),
              icon: Icon(color: Colors.white, Icons.message_outlined),
              label: 'Chat Bot'),
        ],
      ),
      body: <Widget>[
        const Home(),
        const Category(),
        const FeedBack(),
        CustomerService()
      ][currentPageIndex],
    );
  }
}
