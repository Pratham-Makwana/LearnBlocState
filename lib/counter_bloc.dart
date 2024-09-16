import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// as per docs
/// Sealed Class : Restricts inheritance to within the same file
/// Final Class : Prevents ant inheritance
// --------------------------------------------------------------
/// Bloc works concept on the events
/// Cubit works concept on the function
// ---------------------------------------------------------------
/// In bloc we can't use emit function outside of event function
/* if we want to create more event than we need to create base class and extend it with other card*/

// base event
sealed class Counter {}

/// event
final class CounterIncrement extends Counter {}

/// event
final class CounterDecrement extends Counter {}

class CounterBloc extends Bloc<Counter, int> {
  CounterBloc() : super(0) {
    // optimize
    on<CounterIncrement>(_incrementCounter);
    on<CounterDecrement>(_decrementCounter);

    /// event handler
    // on<CounterIncrement>((event, emit) {
    //
    //   emit(state + 1); /// In bloc we can't use emit function outside of event function
    //   log('$state', name: 'Inside cubit');
    // });
  }

  void _incrementCounter(event, emit) {
    /// In bloc we can't use emit function outside of event function

    emit(state + 1);

    //log('$state', name: 'Inside cubit');
  }

  void _decrementCounter(event, emit) {
    /// In bloc we can't use emit function outside of event function

    emit(state - 1);
    //log('$state', name: 'Inside cubit');
  }

  // @override
  // void onChange(Change<int> change) {
  //   super.onChange(change);
  //   log('$runtimeType: $change');
  // }

  // @override
  // void onTransition(Transition<Counter, int> transition) {
  //   super.onTransition(transition);
  //   log('$runtimeType: $transition');
  // }

  // @override
  // void onEvent(Counter event) {
  //   super.onEvent(event);
  //   log('$runtimeType: $event');
  // }
}
