import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/ui/styles/app_color.dart';
import 'package:gerenciadordecontas/models/person.dart';

class AccountWidget extends StatelessWidget {
  final Person person;
  const AccountWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180, // Aumentei a altura para melhor visualização
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 12), // Espaço entre os widgets
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${person.name} ${person.lastName}",
                  style: const TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text("ID: ${person.id}", style: const TextStyle(color: Colors.white70)),
                Text("Telefone: ${person.number}", style: const TextStyle(color: Colors.white70)),
                Text("CPF: ${(person.cpf)}", style: const TextStyle(color: Colors.white70)),
                Text("Nascimento: ${(person.birthday)}", style: const TextStyle(color: Colors.white70)),
                Text("Registrado em: ${(person.registeredAt)}", style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          // Widget para exibir a imagem corretamente
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              person.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 80),
            ),
          ),
        ],
      ),
    );
  }


}