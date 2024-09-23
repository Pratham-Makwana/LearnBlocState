import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'like_state.dart';

class LikeCubit extends Cubit<LikeState> {
  LikeCubit() : super(const LikeState(isTrue: false));

  void changeAnswer(bool isTrue) {
    emit(LikeState(isTrue: isTrue));
  }

  @override
  onChange(Change<LikeState> change) {
    super.onChange(change);
    log('$change', name: '$runtimeType');
  }
}
