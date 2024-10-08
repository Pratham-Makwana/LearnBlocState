import 'package:cubit_demo/bloc/developer_bloc.dart';
import 'package:cubit_demo/data/repository/ip_repository.dart';
import 'package:cubit_demo/equatable_cubit/like_cubit.dart';
import 'package:cubit_demo/ip_cubit/ip_cubit.dart';
import 'package:cubit_demo/presentation/screens/Ip_screen.dart';
import 'package:cubit_demo/screen/equatable_screen.dart';
import 'package:cubit_demo/widgets/myBloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // initialization of blocObserver
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = IpRepository();
    return RepositoryProvider(
      create: (context) => RepositoryProvider.value(
        value: repo,
      ),
      child: BlocProvider(
        create: (context) => LikeCubit(),
        //create: (context) => IpCubit(repo),
        //create: (context) => DeveloperBloc(),
        //create: (context) => RatingCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const EquatableScreen(),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       /// CounterBloc instance only created when its need
//       /// Dependency Injection
//       providers: [
//         /// creating the object of the [CounterBloc] in our code,
//         /// and using the that object in other screen by finding the object
//         BlocProvider(
//           create: (context) => CounterBloc(),
//         ),
//         BlocProvider(
//           create: (context) => CounterCubit(),
//         ),
//       ],
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: const MyHomePage(),
//       ),
//     );
//   }
// }
/**
    Dependency Injection (DI) in Flutter is a design pattern that allow you to
    Inject dependencies(like service , classes or objects)
    into your code rather than creating them directly within th class
 */
// ----------------------------------------------------------------------
// For single bloc Provide
// BlocProvider(
//   /// CounterBloc instance only created when its need
//   create: (context) => CounterBloc(),
//   child: MaterialApp(
//     title: 'Flutter Demo',
//     theme: ThemeData(
//       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       useMaterial3: true,
//     ),
//     home: const MyHomePage(),
//   ),
// );
