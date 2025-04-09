

class Person {
  String imagePath;
  String id;
  String name;
  String lastName;
  String number;
  String cpf;
  DateTime birthday;
  DateTime registeredAt;

  Person({
    required this.imagePath,
    required this.id,
    required this.name,
    required this.lastName,
    required this.number,
    required this.cpf,
    required this.birthday,
    required this.registeredAt,
  });

  static Person getPerson() {
    return Person(
      imagePath: "assets/maria.png", 
      id: "1", 
      name: "Maria", 
      lastName: "Santos", 
      number: "+5586997722354", 
      cpf: "00044472156", 
      birthday: DateTime.parse("1846-02-10"), 
      registeredAt: DateTime.now(),
    );
  }
}