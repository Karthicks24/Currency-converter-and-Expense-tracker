import 'package:currency_converter/pages/profile_page.dart';
import 'package:currency_converter/pages/expenseTracker.dart';
import 'package:currency_converter/pages/settings_page.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  int _selectedIndex = 0;

  void _navigationBottomBar (int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    SecondPage(),
    const ProfilePage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigationBottomBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Tracker"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2),label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings")
      ]),
      body: _pages[_selectedIndex],
    );
  }
}