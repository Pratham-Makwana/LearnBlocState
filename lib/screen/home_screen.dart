import 'dart:developer';

import 'package:cubit_demo/bloc_screen.dart';
import 'package:cubit_demo/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';
import 'cubit_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final cubit = CounterCubit(0);
  final bloc = CounterBloc();

  //nt _counter = 0;

  void _incrementCounter() {
    //counter++;
    // cubit.state++;
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    log("${bloc.state}", name: 'Counter');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const BlocScreen()));
              },
              child: const Text(
                'Bloc',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CubitScreen()));
              },
              child: const Text(
                'Cubit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
