import 'package:cubit_demo/bloc/developer_bloc.dart';
import 'package:cubit_demo/model/developer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeveloperScreen extends StatefulWidget {
  const DeveloperScreen({super.key});

  @override
  State<DeveloperScreen> createState() => _DeveloperScreenState();
}

class _DeveloperScreenState extends State<DeveloperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Developers"),
      ),
      body: BlocBuilder<DeveloperBloc, List<DeveloperModel>>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state[index].name),
                subtitle: Text(state[index].email),
                trailing: IconButton(
                  tooltip: 'Remove',
                    onPressed: () => context
                        .read<DeveloperBloc>()
                        .add(RemoveDeveloper(developer: state[index])),
                    icon: const Icon(CupertinoIcons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        /// adding the event to the bloc
        onPressed: () => context.read<DeveloperBloc>().add(AddDeveloper()),

        tooltip: 'Add Developer',
        child: const Icon(Icons.add),
      ),
    );
  }
}
