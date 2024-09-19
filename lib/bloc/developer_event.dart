part of 'developer_bloc.dart';

@immutable
sealed class DeveloperEvent {}

final class AddDeveloper extends DeveloperEvent {}

final class RemoveDeveloper extends DeveloperEvent {
  final DeveloperModel developer;

  RemoveDeveloper({required this.developer});
}
