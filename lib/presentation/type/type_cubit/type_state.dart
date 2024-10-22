part of 'type_cubit.dart';

sealed class TypeState extends Equatable {
  const TypeState();

  @override
  List<Object> get props => [];
}

final class TypeInitial extends TypeState {}

final class TypeSuccess extends TypeState {}

final class TypeFailure extends TypeState {}

final class TypeEmpty extends TypeState {}
