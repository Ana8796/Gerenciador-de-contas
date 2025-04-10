import 'package:gerenciadordecontas/models/person.dart';

class PersonService {
  Future<List<Person>> getAll() async {
    // Simulando uma requisição assíncrona
    await Future.delayed(const Duration(seconds: 1));
    
    // Retornando pessoas mockadas - CORREÇÕES APLICADAS:
    return [
      Person(
        id: "1",
        name: "Maria",
        lastName: "Santos", 
        number: "+5586997722354",
        cpf: "00044472156",
        imagePath: "assets/images/maria.png",
        birthday: DateTime.parse("1846-02-10"),
        registeredAt: DateTime.now(),
      ),
      Person(
        id: "2",
        name: "João",
        lastName: "Carlos",
        number: "+558699998877",
        cpf: "12345678901",
        imagePath: "assets/joao.png", // Corrigido para joao.png
        birthday: DateTime(1985, 7, 20),
        registeredAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      Person(
        id: "3",
        name: "Ana",
        lastName: "Paula",
        number: "+558699556644",
        cpf: "98765432109",
        imagePath: "assets/images/ana.png",
        birthday: DateTime(1990, 11, 5),
        registeredAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }

  Future<void> addPerson(Person newPerson) async {
    await Future.delayed(const Duration(seconds: 1));
    // Lógica para adicionar pessoa (mantida como está)
  }
}