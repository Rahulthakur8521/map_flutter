import 'package:flutter/material.dart';

class ButtonNavigation extends StatefulWidget {
  const ButtonNavigation({super.key});

  @override
  State<ButtonNavigation> createState() => _ButtonNavigationState();
}

class _ButtonNavigationState extends State<ButtonNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
    PersonScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Navigation Example'),
        ),
        body: _pages[_currentIndex], // Display the current selected page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Current tab index
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the selected tab
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Person',
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
    );
  }
}

// Person Screen
class PersonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Person Screen', style: TextStyle(fontSize: 24)),
    );
  }
}
