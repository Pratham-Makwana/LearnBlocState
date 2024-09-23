part of 'like_cubit.dart';

/// Equatable override  == (comparison) operator
/// and help us to reduce the number of rebuild of UI

// class LikeState extends Equatable {
//   final bool isTrue;
//
//   const LikeState({required this.isTrue});
//
//   @override
//   List<Object?> get props => [isTrue];
// }

///  everytime we click yes again n again the Ui is updating but value remain same that the problem
///  we con overcome this problem with equatable.
///  Using the equatable we can compare the value of object rather than direct objects
///  even if two object are different and having the same value equatable is not rebuild the UI
// -------------- you can avoid use of equatable If you write proper logic while setting the state and updating the UI
class LikeState {
  final bool isTrue;

  const LikeState({required this.isTrue});
}
