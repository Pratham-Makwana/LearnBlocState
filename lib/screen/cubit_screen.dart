


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_counter/controller/counter_cubit.dart';

class CubitScreen extends StatefulWidget {
  const CubitScreen({super.key});

  @override
  State<CubitScreen> createState() => _CubitScreenState();
}

class _CubitScreenState extends State<CubitScreen> {
  // final _cubit = CounterCubit();

  //
  // @override
  // void dispose() {
  //   _cubit.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cubit Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              // bloc: _cubit,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //final cubit = BlocProvider.of<CounterCubit>(context);
          final cubit = context.read<CounterCubit>();
          cubit.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
