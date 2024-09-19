import 'package:cubit_demo/model/developer.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'developer_event.dart';

class DeveloperBloc extends Bloc<DeveloperEvent, List<DeveloperModel>> {
  DeveloperBloc() : super([]) {
    on<AddDeveloper>(_addDeveloper);
    on<RemoveDeveloper>(_removeDeveloper);
  }

  void _addDeveloper(AddDeveloper event, Emitter emit) {
    final faker = Faker();
    final developer = DeveloperModel(
        name: faker.person.name(), email: faker.internet.email());

    state.add(developer);

    // problem is only one list is add
    /// bloc and cubit are immutable Which means we always need to pass new state (object)
    /// It Refers to same object
    /// so we need to pass new list every time whenever we do change in list
    // emit(state);
    /// -------------- Solution -------------------
    /// ----------------------- 1 way
    // emit([...state]); // add the last of list to new list
    /// ----------------------- 2 way
    //   emit([...state, developer]); // add the developer to state and add the last of list to new list

    /// ----------- Prefer Way --------------------
    /// It generate new list reference with the old variable
    emit(List.of(state));
    //List.of() - Compile time type check of objects
    //List.from() - Runtime time type check of objects
  }

  void _removeDeveloper(RemoveDeveloper event, Emitter emit) {
    state.remove(event.developer);
    emit(List.of(state));
  }
}
