import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flutter/bloc/bloc_actions.dart';
import 'package:study_flutter/bloc/bloc_state.dart';
import 'package:study_flutter/bloc/person_bloc.dart';
import 'package:study_flutter/models/person.dart';
import 'package:study_flutter/util/extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(const LoadPersonsAction(
                        url: "",
                        loader: getPersons,
                      ));
                },
                child: const Text('Load Json #1'),
              ),
              TextButton(
                onPressed: () {
                  context.read<PersonsBloc>().add(const LoadPersonsAction(
                        url: '',
                        loader: getPersons,
                      ));
                },
                child: const Text('Load Json #2'),
              ),
            ],
          ),
          BlocBuilder<PersonsBloc, FetchPerson?>(
            buildWhen: (previous, current) {
              return previous?.persons != current?.persons;
            },
            builder: (context, state) {
              state.logToConsole();
              final persons = state?.persons;
              if (persons == null) {
                return const SizedBox();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person = persons[index]!;
                    return ListTile(title: Text(person.name));
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
