import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/models/person.dart';
import 'package:gerenciadordecontas/ui/styles/app_color.dart';
import 'package:gerenciadordecontas/ui/widgets/person_widget.dart';
import 'package:gerenciadordecontas/services/personservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Person>> _futurePersons;
  final PersonService _personService = PersonService();

  @override
  void initState() {
    super.initState();
    _loadPersons();
  }

  void _loadPersons() {
    setState(() {
      _futurePersons = _personService.getPersons();
    });
  }

  Future<void> _refreshPersons() async {
    _loadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: const Text("Sistema de gestão de contas"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, "login"),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: _refreshPersons,
          child: FutureBuilder<List<Person>>(
            future: _futurePersons,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        'Erro ao carregar pessoas: ${snapshot.error}',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadPersons,
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_outline, size: 48),
                      SizedBox(height: 16),
                      Text('Nenhuma pessoa cadastrada.'),
                    ],
                  ),
                );
              }

              final persons = snapshot.data!;
              return ListView.builder(
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  final person = persons[index];
                  return PersonWidget(
                    key: ValueKey(person.id),
                    person: person,
                    onDelete: () async {
                      await _personService.removePerson(person.id);
                      _loadPersons();
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}