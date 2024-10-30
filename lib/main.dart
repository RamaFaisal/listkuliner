import 'package:flutter/material.dart';
import 'package:listkuliner/home_page.dart';
import 'package:listkuliner/styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: pageBgColor, // Ubah sesuai kebutuhan Anda
        appBar: AppBar(
          backgroundColor: headerBackColor, // Ubah sesuai kebutuhan Anda
          title: const Text(
            "Kuliner Nusantara",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
    );
  }
}
