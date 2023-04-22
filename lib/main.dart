import 'package:flutter/material.dart';
import 'package:quize_project/ui/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const colors = [
    Color.fromARGB(255, 46, 4, 118),
    Color.fromARGB(255, 21, 5, 142)
  ];
  @override
  MaterialApp build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: GradientContainer(colors)),
      ),
    );
  }
}
