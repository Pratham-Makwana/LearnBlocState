import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// Global Class to observer the change
class MyObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log('${bloc.runtimeType}: $change');
  }
}
