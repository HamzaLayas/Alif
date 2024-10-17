part of 'explore_cubit.dart';

@immutable
sealed class ExploreState {}

final class ExploreInitial extends ExploreState {}
final class ExploreSuccess extends ExploreState {}
final class ExploreEmpty extends ExploreState {}
final class ExploreFailure extends ExploreState {}
