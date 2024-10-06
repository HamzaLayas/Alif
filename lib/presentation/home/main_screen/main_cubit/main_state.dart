part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class ProfilePageState extends MainState {}

final class SavedPageState extends MainState {}

final class HomePageState extends MainState {}

final class TicketsPageState extends MainState {}

final class ExplorePageState extends MainState {}
