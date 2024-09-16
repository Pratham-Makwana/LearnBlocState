import 'dart:developer';

import 'package:cubit_demo/Cubit/rating_cubit.dart';
import 'package:cubit_demo/Cubit/rating_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// BlocBuilder when you want to work each & every value update on the screen
          /// BlocSelector when you want to listen single state variable update
          BlocBuilder<RatingCubit, RatingState>(
            // buildWhen: (previous, current) =>
            //     previous.blocScore != current.blocScore,
            builder: (context, state) {
              log('Bloc is Awesome', name: 'Rebuild');
              return Text(
                '${state.blocScore} vs ${state.cubitScore}',
                style: const TextStyle(fontSize: 18),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bloc is Awesome: ',
                style: TextStyle(fontSize: 18),
              ),
              BlocSelector<RatingCubit, RatingState, int>(
                selector: (state) => state.blocScore,
                // buildWhen: (previous, current) =>
                //     previous.blocScore != current.blocScore,
                builder: (context, state) {
                  log('Bloc is Awesome', name: 'Rebuild');
                  return Text(
                    '$state',
                    style: const TextStyle(fontSize: 18),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cubit is Awesome: ',
                style: TextStyle(fontSize: 18),
              ),
              BlocSelector<RatingCubit, RatingState, int>(
                selector: (state) => state.cubitScore,

                ///  its false means the builder is not execute it widget
                // buildWhen: (previous, current) =>false,
                /// it take time and may be long we can use BlocSelector instead of BlocBuilder
                // buildWhen: (previous, current) =>
                //     previous.cubitScore != current.cubitScore,
                builder: (context, state) {
                  log('Cubit is Awesome', name: 'Rebuild');
                  return Text(
                    '$state',
                    style: const TextStyle(fontSize: 18),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: context.read<RatingCubit>().upVoteBloc,
                  child: const Text('Up Vote Bloc')),
              ElevatedButton(
                  onPressed: context.read<RatingCubit>().upVoteCubit,
                  child: const Text('Up Vote Cubit'))
            ],
          )
        ],
      ),
    );
  }
}
