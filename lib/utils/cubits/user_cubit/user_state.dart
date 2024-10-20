part of 'user_cubit.dart';

@immutable
sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {}

final class UserLoading extends UserState {}
