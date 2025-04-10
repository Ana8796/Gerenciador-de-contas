import 'package:flutter/material.dart';
import 'package:gerenciadordecontas/models/person.dart';
import 'package:gerenciadordecontas/services/person_service.dart';
import 'package:gerenciadordecontas/ui/widgets/person_widget.dart';
import 'package:gerenciadordecontas/ui/styles/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Person>> _futureGetAll = PersonService().getAll();

  Future<void> refreshGetAll() async {
    setState(() {
      _futureGetAll = PersonService().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: const Text("Sistema gerenciador de contas"),
        actions: [
          IconButton(
            onPressed: () => {Navigator.pushReplacementNamed(context, "login")},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: refreshGetAll,
          child: FutureBuilder(
            future: _futureGetAll,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhuma pessoa encontrada.'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final person = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: AccountWidget(person: person),
                      );
                    },
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}