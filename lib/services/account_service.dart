import 'package:gerenciadordecontas/models/person.dart';

class PersonService {
  final List<Person> _persons = [Person.getPerson()];

  Future<List<Person>> getPersons() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simula operação assíncrona
    return _persons;
  }

  Future<void> addPerson(Person person) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _persons.add(person);
  }

  Future<void> removePerson(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _persons.removeWhere((person) => person.id == id);
  }

  Future<void> updatePerson(Person updatedPerson) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _persons.indexWhere((p) => p.id == updatedPerson.id);
    if (index != -1) {
      _persons[index] = updatedPerson;
    }
  }
}