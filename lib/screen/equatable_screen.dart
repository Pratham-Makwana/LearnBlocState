import 'dart:developer';

import 'package:cubit_demo/equatable_cubit/like_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquatableScreen extends StatelessWidget {
  const EquatableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equatable Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// question
            const Text(
              'Do you like Bloc/Cubit?',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 30,
            ),

            /// answer
            BlocBuilder<LikeCubit, LikeState>(
              /// Without equatable if the both the value are not equal then only update UI

              buildWhen: (previous, current) =>
                  current.isTrue != previous.isTrue,
              builder: (context, state) {
                log('Answer: ${state.isTrue}', name: 'Updated Ui');
                return Text(
                  'Answer : ${state.isTrue ? 'Yes' : 'No'}',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///  yes
                ElevatedButton(
                    onPressed: () =>
                        context.read<LikeCubit>().changeAnswer(true),
                    child: const Text('Yes')),

                /// no
                ElevatedButton(
                    onPressed: () =>
                        context.read<LikeCubit>().changeAnswer(false),
                    child: const Text('No'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
