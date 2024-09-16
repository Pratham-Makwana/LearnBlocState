import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class BlocScreen extends StatefulWidget {
  const BlocScreen({super.key});

  @override
  State<BlocScreen> createState() => _BlocScreenState();
}

class _BlocScreenState extends State<BlocScreen> {
  final _bloc = CounterBloc();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log("${_bloc.state}", name: 'Counter');
    return Scaffold(
      /// appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc Demo'),
      ),

      /// body
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>(
              bloc: _bloc,
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
          _bloc.add(CounterIncrement());
          //bloc.add(CounterDecrement());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
