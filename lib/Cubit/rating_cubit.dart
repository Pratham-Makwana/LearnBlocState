import 'package:flutter_bloc/flutter_bloc.dart';

/*
  part of: Declares that the file belongs to the main file's code.
  part: Links another file to the current file
*/
part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(RatingState(blocScore: 0, cubitScore: 0));

  void upVoteBloc() {
    emit(state.copyWith(blocScore: state.blocScore + 1));
    // emit(RatingState(
    //     blocScore: state.blocScore + 1, cubitScore: state.cubitScore));
  }

  void upVoteCubit() {
    emit(state.copyWith(cubitScore: state.cubitScore + 1));
    // emit(RatingState(
    //     blocScore: state.blocScore, cubitScore: state.cubitScore + 1));
  }
}
