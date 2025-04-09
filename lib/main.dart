import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/ui/home_screen.dart';

void main() {
  runApp(const MinhaBiblioteca());
}

class GerenciadordeContas extends StatelessWidget {
  const GerenciadordeContas({super.key});

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