import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/ui/styles/app_color.dart';
import 'package:gerenciadordecontas/models/person.dart';

class AccountWidget extends StatelessWidget {
  final Person person;
  const AccountWidget({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${person.name} ${person.lastName}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(person.imagePath),
              Text("ID: ${person.id}"),
              Text("Numero: ${person.number.toString()}"),
              Text("cpf: ${person.cpf}"),
              Text("Data de nascimento: ${person.birthday}"),
              Text("Registrado em: ${person.registeredAt}"),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}