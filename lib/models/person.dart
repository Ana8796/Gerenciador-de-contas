class Person {
  String id;
  String name;
  String lastName;
  String number;
  String cpf;
  String imagePath;
  DateTime birthday;
  DateTime registeredAt;

  Person({
    required this.id,
    required this.name,
    required this.lastName,
    required this.number,
    required this.cpf,
    required this.imagePath,
    required this.birthday,
    required this.registeredAt,
  });

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map["id"],
      name: map["name"],
      lastName: map["lastName"],
      number: map["number"],
      cpf: map["cpf"],
      imagePath: map["imagePath"],
      birthday: DateTime.parse(map["birthday"]),
      registeredAt: DateTime.parse(map["registeredAt"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
      'number': number,
      'cpf': cpf,
      'imagePath': imagePath,
      'birthday': birthday,
      'registeredAt': registeredAt,
    };
  }
}