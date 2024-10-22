part of 'saved_cubit.dart';

sealed class SavedState {}

final class SavedInitial extends SavedState {}
final class SavedSuccess extends SavedState {}
final class SavedFailure extends SavedState {}
final class SavedEmpty extends SavedState {}
