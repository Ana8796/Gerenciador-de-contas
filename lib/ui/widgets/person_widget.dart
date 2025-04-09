import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/models/person.dart';

class PersonWidget extends StatelessWidget {
  final Person person;
  final VoidCallback onDelete;

  const PersonWidget({
    super.key,
    required this.person,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(person.imagePath),
        ),
        title: Text('${person.name} ${person.lastName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CPF: ${person.cpf}'),
            Text('Telefone: ${person.number}'),
            Text('Nascimento: ${person.birthday.toString().split(' ')[0]}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
        onTap: () {
          
        },
      ),
    );
  }
}