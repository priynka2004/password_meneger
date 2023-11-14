import 'package:flutter/material.dart';
import 'package:password_meneger/password_save_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),

      theme: ThemeData(
    primarySwatch: Colors.blue,
       ),
      home: const PasswordSaveScreen(),
    );
  }
}
