import 'package:flutter/material.dart';

import 'ui/screens/splach_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskManager',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              elevation: 2,
            ),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.w500),
          )),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
