import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/ui/home_screen.dart';

void main() {
  runApp(const MinhaBiblioteca());
}

class MinhaBiblioteca extends StatelessWidget {
  const MinhaBiblioteca({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => const HomeScreen(),
      },
      
    );
  }
}