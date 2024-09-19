import 'dart:developer';
import 'package:cubit_demo/screen/rating_screen.dart';
import 'package:cubit_demo/screen/bloc_screen.dart';
import 'package:flutter/material.dart';

import '../bloc_counter/controller/counter_bloc.dart';
import 'cubit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

            const SizedBox(height: 25,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RatingScreen()));
              },
              child: const Text(
                'Rating Screen',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
