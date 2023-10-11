import 'package:flutter/material.dart';
import 'package:imc_calculator_flutter/pages/home_page.dart';

import 'package:path/path.dart' as path;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffC8D8DF)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
