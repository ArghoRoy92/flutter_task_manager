import 'package:flutter/material.dart';
import 'package:flutter_task_manager/ui/screens/taskscreens/cancel_task_screen.dart';
import 'package:flutter_task_manager/ui/screens/taskscreens/completed_task_screen.dart';
import 'package:flutter_task_manager/ui/screens/taskscreens/in_progress_task_screen.dart';
import 'package:flutter_task_manager/ui/screens/taskscreens/new_task_screen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({super.key});

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    const NewTask(),
    const ProgressTask(),
    const CancelTask(),
    const CompletedTask(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Colors.green,
        showUnselectedLabels: true,
        onTap: (int index) {
          _selectedScreenIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.task_sharp), label: 'New Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_sharp), label: 'In Progress'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_sharp), label: 'Cancel'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_sharp), label: 'Completed'),
        ],
      ),
    );
  }
}
