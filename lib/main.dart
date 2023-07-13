import 'package:flutter/material.dart';
// import 'package:tienda_dummyjson/app/pages/app_widget.dart';
import 'package:tienda_dummyjson/app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


