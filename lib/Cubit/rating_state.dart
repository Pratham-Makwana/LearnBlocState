part of 'rating_cubit.dart';

class RatingState {
  final int blocScore;

  final int cubitScore;

  RatingState({required this.blocScore, required this.cubitScore});

  RatingState copyWith({int? blocScore, int? cubitScore}) {
    return RatingState(
        blocScore: blocScore ?? this.blocScore,
        cubitScore: cubitScore ?? this.cubitScore);
  }
}
