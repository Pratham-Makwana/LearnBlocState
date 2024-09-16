import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

// when we create the instance we have to pass initial instance
/// State : it represent the current condition of the application
/// State is Immutable (don't change)
class CounterCubit extends Cubit<int> {
  CounterCubit():super(0);

  void incrementCounter() {
    emit(state + 1); // emit is function to pass new state to the function
    //log('$state', name: 'Inside cubit');
  }

  // @override
  // void onChange(Change<int> change) {
  //   super.onChange(change);
  //   log('$runtimeType: $change');
  // }
}
